import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class FormStepIndicator extends StatelessWidget {
  final bool active;

  const FormStepIndicator({super.key, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: active ? TColors.primary : TColors.neutralLightMedium,
      ),
      height: 8,
    );
  }
}
