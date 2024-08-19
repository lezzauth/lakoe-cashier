import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightTheme = ChipThemeData(
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(
          color: TColors.primary,
          width: 0.5,
          style: BorderStyle.solid,
        );
      }

      return const BorderSide(
        color: TColors.neutralLightDark,
        width: 0.5,
        style: BorderStyle.solid,
      );
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.inputRadius),
    ),
    labelStyle: GoogleFonts.inter(
      color: TColors.neutralDarkDarkest,
      fontSize: TSizes.fontSizeBodyS,
    ),
    backgroundColor: Colors.transparent,
    selectedColor: TColors.highlightLightest,
    showCheckmark: false,
  );

  static ChipThemeData darkTheme = const ChipThemeData();
}
