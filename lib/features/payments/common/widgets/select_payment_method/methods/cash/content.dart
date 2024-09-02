import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/form.dart';

class CashPaymentContent extends StatefulWidget {
  final int amount;
  const CashPaymentContent({super.key, required this.amount});

  @override
  State<CashPaymentContent> createState() => _CashPaymentContentState();
}

class _CashPaymentContentState extends State<CashPaymentContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CashPaymentForm(
          amount: widget.amount,
        )
      ],
    );
  }
}
