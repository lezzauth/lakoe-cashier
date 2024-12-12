import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/bank_transfer/content.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/cash/content.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/debit/content.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/qris/content.dart';

class SelectPaymentMethodTablet extends StatefulWidget {
  const SelectPaymentMethodTablet({
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
  State<SelectPaymentMethodTablet> createState() =>
      _SelectPaymentMethodTabletState();
}

class _SelectPaymentMethodTabletState extends State<SelectPaymentMethodTablet> {
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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppbar(
            title: "",
            leading: TextHeading1("Pembayaran"),
          ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                  builder: (context, state) => switch (state.paymentMethod) {
                    "CASH" => CashPaymentContent(amount: amount),
                    "QR_CODE" => QrisPaymentContent(amount: amount),
                    "DEBIT" => DebitPaymentContent(amount: amount),
                    "BANK_TRANSFER" =>
                      BankTransferPaymentContent(amount: amount),
                    _ => const SizedBox(),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
