import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TSnackbarTheme {
  TSnackbarTheme._();

  static SnackBarThemeData lightTheme = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: TColors.neutralDarkDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}
