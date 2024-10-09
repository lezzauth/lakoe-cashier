import 'package:app_config_provider/app_config_provider.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfigProvider.apiUrl,
    ),
  );

  Dio get dio {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return _dio;
  }
}
