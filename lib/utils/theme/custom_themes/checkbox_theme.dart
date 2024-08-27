import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData lightTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        TSizes.checkBoxRadius,
      ),
    ),
    checkColor: WidgetStateProperty.resolveWith(
      (states) {
        return TColors.neutralLightLightest;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.primary;
        }
        return TColors.neutralLightLightest;
      },
    ),
    visualDensity: VisualDensity.compact,
    side: WidgetStateBorderSide.resolveWith(
      (states) {
        Color? color;
        if (states.contains(WidgetState.selected)) {
          color = TColors.primary;
        } else {
          color = TColors.neutralLightDarkest;
        }

        return BorderSide(color: color, width: 1.5);
      },
    ),
  );

  static CheckboxThemeData darkTheme = CheckboxThemeData();
}
