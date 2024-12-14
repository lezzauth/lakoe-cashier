import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme lightTheme = InputDecorationTheme(
    isDense: true,
    disabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputRadius),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.neutralLightDarkest,
      ),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputRadius),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.neutralLightDarkest,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        TSizes.inputRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.neutralLightDarkest,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        TSizes.inputRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.primary,
      ),
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeBodyM,
      color: TColors.neutralDarkLightest,
    ),
    labelStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeBodyM,
      color: TColors.neutralDarkDarkest,
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        TSizes.inputRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.error,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        TSizes.inputRadius,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.error,
      ),
    ),
    helperStyle: GoogleFonts.inter(
      fontSize: TSizes.fontSizeBodyS,
      color: TColors.neutralDarkLightest,
    ),
  );
}
