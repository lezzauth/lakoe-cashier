import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/form.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/debit/form.dart';

class DebitPaymentContent extends StatefulWidget {
  const DebitPaymentContent({super.key});

  @override
  State<DebitPaymentContent> createState() => DebitPaymentContentState();
}

class DebitPaymentContentState extends State<DebitPaymentContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DebitPaymentForm(),
      ],
    );
  }
}
