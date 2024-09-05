import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TTextButtonTheme {
  static TextButtonThemeData lightTheme = TextButtonThemeData(
      style: ButtonStyle(textStyle: WidgetStateTextStyle.resolveWith(
    (states) {
      bool isDisabled = states.contains(WidgetState.disabled);

      return TextStyle(
        color: isDisabled ? TColors.neutralDarkLight : TColors.primary,
      );
    },
  )));

  static TextButtonThemeData darkTheme = lightTheme;
}
