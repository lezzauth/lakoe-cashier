import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TRadioTheme {
  TRadioTheme._();

  static RadioThemeData lightTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          // return TColors.primary;
          return Colors.red;
        }
        return TColors.neutralLightDarkest;
      },
    ),
    materialTapTargetSize: MaterialTapTargetSize.padded,
    visualDensity: VisualDensity.compact,
  );

  static RadioThemeData darkTheme = RadioThemeData();
}
