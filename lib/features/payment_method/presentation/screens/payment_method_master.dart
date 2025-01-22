import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/bank_account_not_available.dart';
import 'package:lakoe_pos/features/payment_method/presentation/widgets/section/section_card.dart';
import 'package:lakoe_pos/features/payment_method/presentation/widgets/section/section_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';
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
  List<PaymentMethodCashier> paymentMethods = [];
  List<OwnerBankModel> bankAccounts = [];
  bool _isSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);
    _onInit();
    _getBankAccount();
  }

  Future<void> _onInit() async {
    await context.read<PaymentMethodCubit>().findAll();
  }

  Future<void> _getBankAccount() async {
    await context.read<BankAccountMasterCubit>().init();
  }

  void _updatePaymentMethodStatus(String id, bool newValue) {
    setState(() {
      final activeMethods = paymentMethods.where((method) {
        final isActive = temporaryChanges.containsKey(method.id)
            ? temporaryChanges[method.id]!
            : method.isActive;
        return isActive;
      }).toList();

      final isBankTransfer = paymentMethods.any(
          (method) => method.id == id && method.channel == 'BANK_TRANSFER');

      if (isBankTransfer && newValue && bankAccounts.isEmpty) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const CustomBottomsheet(
              child: BankAccountNotAvailable(),
            );
          },
        );
        HapticFeedback.vibrate();
        return;
      }

      if (activeMethods.length == 1 && !newValue) {
        CustomToast.showWithContext(
          context,
          "Minimal ada satu metode aktif!",
          icon: TIcons.warning,
          position: 'bottom',
          duration: 2,
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

            if (context.mounted) {
              CustomToast.showWithContext(
                context,
                "Metode pembayaran tersimpan",
                icon: TIcons.checkBold,
                position: 'bottom',
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
      CustomToast.showWithContext(
        context,
        "Minimal ada satu metode aktif!",
        icon: TIcons.warning,
        position: 'bottom',
        duration: 2,
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

        setState(() {
          temporaryChanges.clear();
        });

        if (!context.mounted) return;
        CustomToast.showWithContext(
          context,
          "Metode pembayaran tersimpan",
          icon: TIcons.checkBold,
          position: 'bottom',
          backgroundColor: TColors.success,
          duration: 2,
        );

        Navigator.pop(context);
      } catch (error) {
        if (!mounted) return;

        CustomToast.showWithContext(
          context,
          "Gagal menyimpan perubahan. Coba lagi!",
          position: 'bottom',
          backgroundColor: TColors.error,
          duration: 2,
        );
        HapticFeedback.vibrate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PaymentMethodCubit, PaymentMethodState>(
          listener: (context, state) {},
        ),
        BlocListener<BankAccountMasterCubit, BankAccountMasterState>(
          listener: (context, state) {
            if (state is BankAccountMasterLoadSuccess) {
              bankAccounts = state.bankAccounts;
            } else if (state is BankAccountMasterLoadFailure) {
              Logman.instance
                  .error("Failed to load bank accounts: ${state.error}");
            }
          },
        ),
      ],
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
                            .asMap()
                            .map((index, item) => MapEntry(
                                  index,
                                  PaymentSectionItem(
                                    title: item.name,
                                    subTitle: item.description,
                                    isActive:
                                        temporaryChanges.containsKey(item.id)
                                            ? temporaryChanges[item.id]!
                                            : item.isActive,
                                    lastItem: index ==
                                        nonEdcRequiredMethods.length - 1,
                                    onToggleActive: (newValue) {
                                      _updatePaymentMethodStatus(
                                          item.id, newValue);
                                    },
                                  ),
                                ))
                            .values
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
                            .asMap()
                            .map((index, item) => MapEntry(
                                  index,
                                  PaymentSectionItem(
                                    title: item.name,
                                    subTitle: item.description,
                                    isActive:
                                        temporaryChanges.containsKey(item.id)
                                            ? temporaryChanges[item.id]!
                                            : item.isActive,
                                    lastItem:
                                        index == edcRequiredMethods.length - 1,
                                    onToggleActive: (newValue) {
                                      _updatePaymentMethodStatus(
                                          item.id, newValue);
                                    },
                                  ),
                                ))
                            .values
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
