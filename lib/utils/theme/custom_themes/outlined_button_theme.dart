import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStatePropertyAll(TSizes.buttonElevation),
      side: WidgetStateBorderSide.resolveWith(
        (states) {
          bool isDisabled = states.contains(WidgetState.disabled);

          return BorderSide(
            color: isDisabled ? TColors.neutralLightDarkest : TColors.primary,
            width: 1.5,
          );
        },
      ),
      padding: WidgetStateProperty.all(
        EdgeInsets.all(TSizes.buttonVerticalPadding),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(TSizes.buttonRadius),
          ),
        ),
      ),
      textStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          bool isDisabled = states.contains(WidgetState.disabled);

          return GoogleFonts.inter(
            fontSize: TSizes.fontSizeActionL,
            color: isDisabled ? TColors.neutralDarkLightest : TColors.primary,
            fontWeight: FontWeight.w600,
          );
        },
      ),
    ),
  );
  static OutlinedButtonThemeData darkTheme = lightTheme;
}
