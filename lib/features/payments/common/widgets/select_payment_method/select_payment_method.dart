import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/debit/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/qris/content.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

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
          child: Wrap(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                        child: const TextHeading2("Metode pembayaran"),
                      )
                    ],
                  ),
                  BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                    builder: (context, state) => switch (state.paymentMethod) {
                      "CASH" => CashPaymentContent(
                          amount: widget.amount,
                        ),
                      "QR_CODE" => QrisPaymentContent(amount: widget.amount),
                      "DEBIT" => DebitPaymentContent(amount: widget.amount),
                      "BANK_TRANSFER" => BankTransferPaymentContent(
                          amount: widget.amount,
                        ),
                      _ => const SizedBox(),
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
