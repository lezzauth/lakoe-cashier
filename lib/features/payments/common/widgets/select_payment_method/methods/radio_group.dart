import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio.dart';

class PaymentMethodRadioGroup extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const PaymentMethodRadioGroup({
    super.key,
    this.value = "cash",
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                // enabled: false,
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
              // enabled: false,
            ),
          ],
        ),
      ],
    );
  }
}
