import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method_not_available.dart';

class PaymentMethodRadioGroup extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final List<String> limitedValues;

  const PaymentMethodRadioGroup({
    super.key,
    this.value = "CASH",
    required this.onChanged,
    required this.limitedValues,
  });

  @override
  Widget build(BuildContext context) {
    onLimitedPressed() {
      Navigator.pop(context);
      showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) {
          return const SelectPaymentMethodNotAvailable();
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
                value: "CASH",
                groupValue: value,
                onChanged: onChanged,
              ),
              const SizedBox(width: 12),
              PaymentMethodRadio(
                value: "QR_CODE",
                groupValue: value,
                onChanged: onChanged,
                limited: limitedValues.contains("QR_CODE"),
                onLimited: onLimitedPressed,
              ),
            ],
          ),
        ),
        Row(
          children: [
            PaymentMethodRadio(
              value: "DEBIT",
              groupValue: value,
              onChanged: onChanged,
            ),
            const SizedBox(width: 12),
            PaymentMethodRadio(
              value: "BANK",
              groupValue: value,
              onChanged: onChanged,
              limited: limitedValues.contains("BANK"),
              onLimited: onLimitedPressed,
            ),
          ],
        ),
      ],
    );
  }
}
