import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightTheme = const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    dragHandleColor: TColors.neutralLightDark,
    showDragHandle: true,
    dragHandleSize: Size.fromHeight(5),
  );

  static BottomSheetThemeData darkTheme = lightTheme;
}
