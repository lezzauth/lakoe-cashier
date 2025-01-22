import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/bank_transfer/content.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/cash/content.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/debit/content.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/qris/content.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({
    super.key,
    required this.amount,
    required this.onPaymentCash,
    required this.onPaymentBankTransfer,
    required this.onPaymentDebitCredit,
    required this.onPaymentQRCode,
  });

  final double amount;
  final ValueChanged<PaymentCash> onPaymentCash;
  final ValueChanged<PaymentBankTransfer> onPaymentBankTransfer;
  final ValueChanged<PaymentDebitCredit> onPaymentDebitCredit;
  final ValueChanged<PaymentQRCode> onPaymentQRCode;

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    double amount = double.parse(widget.amount.toStringAsFixed(2));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PaymentCubit()),
        BlocProvider(create: (context) => PaymentFilterCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentCash) {
                widget.onPaymentCash(state);
              }
              if (state is PaymentBankTransfer) {
                widget.onPaymentBankTransfer(state);
              }
              if (state is PaymentDebitCredit) {
                widget.onPaymentDebitCredit(state);
              }
              if (state is PaymentQRCode) {
                widget.onPaymentQRCode(state);
              }
            },
          )
        ],
        child: Padding(
          padding: TDeviceUtils.getViewInsets(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeading2("Metode pembayaran"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/payment_method");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UiIcons(
                            TIcons.dashboardSettings,
                            color: TColors.primary,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          TextActionL("Ubah", color: TColors.primary),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                builder: (context, state) => switch (state.paymentMethod) {
                  "CASH" => CashPaymentContent(amount: amount),
                  "BANK_TRANSFER" => BankTransferPaymentContent(amount: amount),
                  "QR_CODE" => QrisPaymentContent(amount: amount),
                  "DEBIT" => DebitPaymentContent(amount: amount),
                  _ => SizedBox(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
