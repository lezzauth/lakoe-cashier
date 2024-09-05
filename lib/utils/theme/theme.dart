import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/chip_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/switch_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/tab_bar_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/text_button_theme.dart';
import 'package:point_of_sales_cashier/utils/theme/custom_themes/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme(),
    primaryTextTheme: GoogleFonts.interTextTheme(),
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightTheme,
    inputDecorationTheme: TTextFieldTheme.lightTheme,
    checkboxTheme: TCheckboxTheme.lightTheme,
    chipTheme: TChipTheme.lightTheme,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: TColors.primary,
    ),
    fontFamily: GoogleFonts.inter().fontFamily,
    canvasColor: Colors.transparent,
    tabBarTheme: TTabBarTheme.lightTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightTheme,
    switchTheme: TSwitchTheme.lightTheme,
    textButtonTheme: TTextButtonTheme.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme(),
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: Colors.black,
  );
}
