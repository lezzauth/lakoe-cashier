import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method_not_available.dart';

class PaymentMethodRadioGroup extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final List<String> limitedValues;

  const PaymentMethodRadioGroup(
      {super.key,
      this.value = "cash",
      required this.onChanged,
      required this.limitedValues});

  @override
  Widget build(BuildContext context) {
    onLimitedPressed() {
      Navigator.pop(context);
      showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) {
          return SelectPaymentMethodNotAvailable();
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              PaymentMethodRadio(
                value: "cash",
                groupValue: value,
                onChanged: onChanged,
              ),
              const SizedBox(width: 12),
              PaymentMethodRadio(
                value: "qris",
                groupValue: value,
                onChanged: onChanged,
                limited: limitedValues.contains("qris"),
                onLimited: onLimitedPressed,
              ),
            ],
          ),
        ),
        Row(
          children: [
            PaymentMethodRadio(
              value: "debit",
              groupValue: value,
              onChanged: onChanged,
            ),
            const SizedBox(width: 12),
            PaymentMethodRadio(
              value: "bank_transfer",
              groupValue: value,
              onChanged: onChanged,
              limited: limitedValues.contains("bank_transfer"),
              onLimited: onLimitedPressed,
            ),
          ],
        ),
      ],
    );
  }
}
