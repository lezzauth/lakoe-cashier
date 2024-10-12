import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TFilledButtonTheme {
  TFilledButtonTheme._();

  static final FilledButtonThemeData lightTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      disabledForegroundColor: TColors.neutralLightLightest,
      disabledBackgroundColor: TColors.neutralLightDarkest,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeActionL,
        color: TColors.neutralLightLightest,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
  );

  static final FilledButtonThemeData darkTheme = FilledButtonThemeData();
}
