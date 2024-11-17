import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TFilledButtonTheme {
  TFilledButtonTheme._();

  static final FilledButtonThemeData lightTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      disabledForegroundColor: TColors.neutralLightLightest,
      disabledBackgroundColor: TColors.neutralLightDarkest,
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
