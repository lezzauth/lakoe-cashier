import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: TSizes.buttonElevation,
      foregroundColor: TColors.neutralLightLightest,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.neutralLightLightest,
      disabledBackgroundColor: TColors.neutralLightDarkest,
      padding: const EdgeInsets.all(TSizes.buttonVerticalPadding),
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
