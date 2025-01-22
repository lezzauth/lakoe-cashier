import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/form/custom_checkbox.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/qris/footer.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/qris/form.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/radio_group.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class QrisPaymentContent extends StatefulWidget {
  const QrisPaymentContent({
    super.key,
    required this.amount,
  });

  final double amount;

  @override
  State<QrisPaymentContent> createState() => _QrisPaymentContentState();
}

class _QrisPaymentContentState extends State<QrisPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;
  bool useQRISStatic = false;

  void _onSubmitted() {
    FocusScope.of(context).unfocus();
    if (_isFormValid && _formKey.currentState?.saveAndValidate() == true) {
      dynamic value = _formKey.currentState?.value;

      context.read<PaymentCubit>().setQRCodePayment(
            paidAmount: widget.amount,
            paidFrom: useQRISStatic ? "CASHIER" : "EDC",
            approvalCode: useQRISStatic ? null : value["codeApproval"],
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        if (state is PaymentMethodLoadSuccess) {
          final activePaymentMethods = state.paymentMethod
              .where((method) => method.isActive && method.channel == "QR_CODE")
              .toList();

          final hasNeedEdc =
              activePaymentMethods.any((method) => method.isNeedEdc);

          final hasNeedEdcFalse =
              activePaymentMethods.any((method) => !method.isNeedEdc);

          final showQrisPaymentForm =
              (activePaymentMethods.length > 1 && hasNeedEdc) ||
                  (activePaymentMethods.length == 1 && hasNeedEdc);

          // if (hasNeedEdcFalse) {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     setState(() {
          //       useQRISStatic = false;
          //     });
          //   });
          // }
          if (!showQrisPaymentForm) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                useQRISStatic = true;
                _isFormValid = true;
              });
            });
          }

          return FormBuilder(
            key: _formKey,
            onChanged: () {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _isFormValid = _formKey.currentState?.isValid ?? false;
                setState(() {});
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                        builder: (context, state) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 12.0,
                            ),
                            child: PaymentMethodRadioGroup(
                              value: state.paymentMethod,
                              onChanged: (value) {
                                context
                                    .read<PaymentFilterCubit>()
                                    .setPaymentMethod(paymentMethod: value!);
                              },
                              limitedValues: const [],
                            ),
                          );
                        },
                      ),
                      if (showQrisPaymentForm && hasNeedEdcFalse)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          child: Row(
                            children: [
                              CustomCheckbox(
                                value: useQRISStatic,
                                onChanged: (bool value) {
                                  setState(() {
                                    useQRISStatic = value;
                                    _isFormValid = value;
                                  });
                                },
                              ),
                              SizedBox(width: 12),
                              TextBodyL(
                                "Tidak menggunakan mesin EDC",
                                color: TColors.neutralDarkDark,
                              ),
                            ],
                          ),
                        ),
                      if (!showQrisPaymentForm || useQRISStatic)
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 12, 20, 12),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: TColors.neutralLightLight,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: TColors.neutralLightMedium,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UiIcons(
                                TIcons.scanner,
                                size: 32,
                                color: TColors.neutralDarkLightest,
                              ),
                              SizedBox(width: 12),
                              Flexible(
                                child: TextBodyM(
                                  "Silakan minta pembeli untuk melakukan scan QRIS yang tersedia.",
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (showQrisPaymentForm)
                        QrisPaymentForm(
                          useQRISStatic: useQRISStatic,
                          onSubmitted: _onSubmitted,
                        ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: QrisPaymentFooter(
                    onCanceled: () {
                      Navigator.pop(context);
                    },
                    onSubmitted: _onSubmitted,
                    isFormValid: _isFormValid,
                  ),
                ),
              ],
            ),
          );
        } else if (state is PaymentMethodLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("Tidak ada data metode pembayaran"));
        }
      },
    );
  }
}
