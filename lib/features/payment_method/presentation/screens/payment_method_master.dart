import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/presentation/widgets/section/section_card.dart';
import 'package:lakoe_pos/features/payment_method/presentation/widgets/section/section_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:payment_repository/payment_repository.dart';

class PaymentMethodMasterScreen extends StatelessWidget {
  const PaymentMethodMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentMethodMaster();
  }
}

class PaymentMethodMaster extends StatefulWidget {
  const PaymentMethodMaster({super.key});

  @override
  State<PaymentMethodMaster> createState() => _PaymentMethodMasterState();
}

class _PaymentMethodMasterState extends State<PaymentMethodMaster> {
  Map<String, bool> temporaryChanges = {};
  List<PaymentMethod> paymentMethods = [];
  bool _isSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    CustomToast.init;
    _onInit();
  }

  Future<void> _onInit() async {
    await context.read<PaymentMethodCubit>().findAll();
  }

  void _updatePaymentMethodStatus(String id, bool newValue) {
    setState(() {
      final activeMethods = paymentMethods.where((method) {
        final isActive = temporaryChanges.containsKey(method.id)
            ? temporaryChanges[method.id]!
            : method.isActive;
        return isActive;
      }).toList();

      if (activeMethods.length == 1 && !newValue) {
        CustomToast.show(
          "Minimal ada satu metode pembayaran aktif!",
        );
        HapticFeedback.vibrate();
      } else {
        temporaryChanges[id] = newValue;

        _isSaveButtonEnabled = temporaryChanges.isNotEmpty;
      }
    });
  }

  void _showPopupConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopupConfirmation(
          title: "Ada yang berubah...",
          message:
              'Kamu telah melakukan perubahan pengaturan metode pembayaran.\nMau disimpan atau diabaikan?',
          labelButtonPrimary: "Simpan",
          labelButtonSecondary: "Abaikan",
          primaryAction: () async {
            await _savePaymentMethodChanges(context);

            if (mounted) {
              CustomToast.show(
                "Perubahan berhasil disimpan!",
                position: 'center',
                backgroundColor: TColors.success,
                duration: 2,
              );
              Navigator.pop(context);
            }
          },
          secondaryAction: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> _savePaymentMethodChanges(BuildContext context) async {
    final activeMethods = paymentMethods.where((method) {
      final isActive = temporaryChanges.containsKey(method.id)
          ? temporaryChanges[method.id]!
          : method.isActive;
      return isActive;
    }).toList();

    if (activeMethods.isEmpty) {
      CustomToast.show(
        "Minimal ada satu metode pembayaran aktif!",
      );
      HapticFeedback.vibrate();
      return;
    }

    final changes = temporaryChanges.entries
        .where((entry) => paymentMethods.any((method) =>
            method.id == entry.key && method.isActive != entry.value))
        .map((entry) =>
            SetActivePaymentMethodDto(id: entry.key, isActive: entry.value))
        .toList();

    if (changes.isNotEmpty) {
      try {
        await context.read<PaymentMethodCubit>().setActive(changes);

        if (!mounted) return;

        setState(() {
          temporaryChanges.clear();
        });

        CustomToast.show(
          "Perubahan berhasil disimpan!",
          position: 'center',
          backgroundColor: TColors.success,
          duration: 2,
        );

        Navigator.pop(context);
      } catch (error) {
        if (!mounted) return;

        CustomToast.show("Gagal menyimpan perubahan. Coba lagi!");
        HapticFeedback.vibrate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentMethodCubit, PaymentMethodState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Metode Pembayaran",
          handleBackButton: () {
            if (temporaryChanges.isEmpty) {
              Navigator.pop(context);
            } else {
              _showPopupConfirmation(context);
            }
          },
          actions: [
            TextButton(
              onPressed: _isSaveButtonEnabled
                  ? () => _savePaymentMethodChanges(context)
                  : null,
              child: TextActionL(
                "SIMPAN",
                color: _isSaveButtonEnabled
                    ? TColors.primary
                    : TColors.neutralDarkLightest,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _onInit,
          backgroundColor: TColors.neutralLightLightest,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                builder: (context, state) {
              if (state is PaymentMethodLoadSuccess) {
                paymentMethods = state.paymentMethod;

                final edcRequiredMethods =
                    paymentMethods.where((item) => item.isNeedEdc).toList();
                final nonEdcRequiredMethods =
                    paymentMethods.where((item) => !item.isNeedEdc).toList();

                return ListView(
                  children: [
                    if (nonEdcRequiredMethods.isNotEmpty) ...[
                      PaymentSectionCard(
                        children: nonEdcRequiredMethods
                            .map(
                              (item) => PaymentSectionItem(
                                title: item.name,
                                subTitle: item.description,
                                isActive: temporaryChanges.containsKey(item.id)
                                    ? temporaryChanges[item.id]!
                                    : item.isActive,
                                lastItem: false,
                                onToggleActive: (newValue) {
                                  _updatePaymentMethodStatus(item.id, newValue);
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    if (edcRequiredMethods.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.only(top: 32),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: const TextHeading5(
                          "DIHARUSKAN PUNYA MESIN EDC",
                          color: TColors.neutralDarkLightest,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      PaymentSectionCard(
                        children: edcRequiredMethods
                            .map(
                              (item) => PaymentSectionItem(
                                title: item.name,
                                subTitle: item.description,
                                isActive: temporaryChanges.containsKey(item.id)
                                    ? temporaryChanges[item.id]!
                                    : item.isActive,
                                lastItem: false,
                                onToggleActive: (newValue) {
                                  _updatePaymentMethodStatus(item.id, newValue);
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                );
              } else if (state is PaymentMethodLoadInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PaymentMethodLoadFailure) {
                return EmptyList(
                  title: "Gagal memuat data, nih!",
                  subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                  action: TextButton(
                    onPressed: _onInit,
                    child: TextActionL(
                      "Coba Lagi",
                      color: TColors.primary,
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ),
        ),
      ),
    );
  }
}
