import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/chip_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/dialog_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/filled_button_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/radio_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/snackbar_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/switch_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/tab_bar_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/text_button_theme.dart';
import 'package:lakoe_pos/utils/theme/custom_themes/text_field_theme.dart';

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
    outlinedButtonTheme: TOutlinedButtonTheme.lightTheme,
    inputDecorationTheme: TTextFieldTheme.lightTheme,
    filledButtonTheme: TFilledButtonTheme.lightTheme,
    checkboxTheme: TCheckboxTheme.lightTheme,
    radioTheme: TRadioTheme.lightTheme,
    chipTheme: TChipTheme.lightTheme,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: TColors.primary,
      error: TColors.error,
    ),
    fontFamily: GoogleFonts.inter().fontFamily,
    canvasColor: Colors.transparent,
    tabBarTheme: TTabBarTheme.lightTheme,
    switchTheme: TSwitchTheme.lightTheme,
    textButtonTheme: TTextButtonTheme.lightTheme,
    bottomSheetTheme: TBottomSheetTheme.lightTheme,
    snackBarTheme: TSnackbarTheme.lightTheme,
    dialogTheme: TDialogTheme.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme(),
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: Colors.black,
  );
}
