import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

void main() async {
  await initializeDateFormatting("id_ID", null);
  runApp(const App());
}
