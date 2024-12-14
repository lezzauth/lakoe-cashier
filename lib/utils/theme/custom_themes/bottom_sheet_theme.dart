import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
    // showDragHandle: true,
    dragHandleSize: Size.fromHeight(5),
  );

  static BottomSheetThemeData darkTheme = lightTheme;
}
