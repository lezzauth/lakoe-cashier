import 'package:app_config_provider/app_config_provider.dart';
import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lakoe_pos/app.dart';
import 'package:intl/date_symbol_data_local.dart';

final AppDataProvider _appDataProvider = AppDataProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _appDataProvider.setFlavor('Production');
  AppConfigProvider.setFlavor('Production');

  await dotenv.load(fileName: ".env");
  await initializeDateFormatting("id_ID", null);

  final dioProvider = DioProvider();
  addRetryInterceptor(dioProvider.dio);

  runApp(const App(flavor: 'Production'));
}
