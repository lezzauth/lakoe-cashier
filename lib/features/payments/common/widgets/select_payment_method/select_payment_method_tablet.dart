import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/debit/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/qris/content.dart';

class SelectPaymentMethodTablet extends StatefulWidget {
  const SelectPaymentMethodTablet({
    super.key,
    required this.amount,
    required this.onPaymentCash,
  });

  final int amount;
  final ValueChanged<PaymentCash> onPaymentCash;

  @override
  State<SelectPaymentMethodTablet> createState() =>
      _SelectPaymentMethodTabletState();
}

class _SelectPaymentMethodTabletState extends State<SelectPaymentMethodTablet> {
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
            },
          )
        ],
        child: Scaffold(
          appBar: const CustomAppbar(
            title: "",
            leading: TextHeading1("Pembayaran"),
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child:
                          BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                        builder: (context, state) =>
                            switch (state.paymentMethod) {
                          "CASH" => CashPaymentContent(
                              amount: widget.amount,
                            ),
                          "QR_CODE" => const QrisPaymentContent(),
                          "DEBIT" => const DebitPaymentContent(),
                          "BANK" => const BankTransferPaymentContent(),
                          _ => const SizedBox(),
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
