import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_large.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';

class BillListPrice extends StatelessWidget {
  final String label;
  final String price;
  final bool isLarge;
  final bool isBold;

  const BillListPrice({
    super.key,
    required this.label,
    required this.price,
    this.isLarge = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: isLarge
              ? TextLarge(label)
              : TextSmall(
                  label,
                  isBold: isBold,
                ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: isLarge
              ? TextLarge(
                  price,
                  textAlign: TextAlign.right,
                )
              : TextSmall(
                  price,
                  isBold: isBold,
                  textAlign: TextAlign.right,
                ),
        ),
      ],
    );
  }
}
