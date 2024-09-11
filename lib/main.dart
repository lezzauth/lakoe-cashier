import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

void main() async {
  await initializeDateFormatting("id_ID", null);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: TColors.neutralLightLightest,
      systemNavigationBarColor: TColors.neutralLightLightest,
    ),
  );
  runApp(const App());
}
