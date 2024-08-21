import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TTabBarTheme {
  TTabBarTheme._();

  static TabBarTheme lightTheme = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    indicator: BoxDecoration(
      color: TColors.neutralDarkDarkest,
      borderRadius: BorderRadius.circular(12.0),
    ),
    labelColor: TColors.neutralLightLightest,
    unselectedLabelColor: TColors.neutralDarkLight,
  );

  static TabBarTheme darkTheme = lightTheme;
}
