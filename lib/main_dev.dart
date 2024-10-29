import 'package:app_config_provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:point_of_sales_cashier/app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfigProvider.setFlavor('Development');

  await dotenv.load(fileName: ".env");
  await initializeDateFormatting("id_ID", null);

  runApp(const App(flavor: 'Development'));
}
