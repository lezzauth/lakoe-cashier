import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
        side: WidgetStateBorderSide.resolveWith(
          (states) {
            bool isDisabled = states.contains(WidgetState.disabled);

            return BorderSide(
              color: isDisabled ? TColors.neutralLightDarkest : TColors.primary,
              width: 1.5,
            );
          },
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                12.0,
              ),
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
        )),
  );
  static OutlinedButtonThemeData darkTheme = lightTheme;
}
