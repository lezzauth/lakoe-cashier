import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: TSizes.buttonElevation,
      foregroundColor: TColors.neutralLightLightest,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.neutralLightLightest,
      disabledBackgroundColor: TColors.neutralDarkLightest,
      padding:
          const EdgeInsets.symmetric(vertical: TSizes.buttonVerticalPadding),
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

  static final ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData();
}
