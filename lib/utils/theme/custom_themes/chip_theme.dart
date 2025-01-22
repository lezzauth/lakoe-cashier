import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightTheme = ChipThemeData(
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(
          color: TColors.primary,
          width: 1,
          style: BorderStyle.solid,
        );
      }

      return const BorderSide(
        color: TColors.neutralLightDark,
        width: 1,
        style: BorderStyle.solid,
      );
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.inputRadius),
    ),
    labelStyle: GoogleFonts.inter(
      color: TColors.neutralDarkDarkest,
      fontSize: TSizes.fontSizeBodyM,
    ),
    backgroundColor: Colors.transparent,
    selectedColor: TColors.highlightLightest,
    surfaceTintColor: TColors.error,
    selectedShadowColor: TColors.errorDark,
    secondarySelectedColor: TColors.info,
    color: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.highlightLightest;
        }

        return Colors.transparent;
      },
    ),
    showCheckmark: false,
  );

  static ChipThemeData darkTheme = const ChipThemeData();
}
