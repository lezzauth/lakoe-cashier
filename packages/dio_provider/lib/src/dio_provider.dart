import 'package:dio/dio.dart';

class DioProvider {
  static final Dio _dio = Dio(BaseOptions(
      baseUrl:
          "https://7796-2404-8000-1005-e48c-6891-d0a0-cfa1-8674.ngrok-free.app"));

  Dio get dio {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return _dio;
  }
}
