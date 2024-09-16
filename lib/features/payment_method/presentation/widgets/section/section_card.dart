import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PaymentSectionCard extends StatelessWidget {
  final List<Widget> children;
  const PaymentSectionCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
