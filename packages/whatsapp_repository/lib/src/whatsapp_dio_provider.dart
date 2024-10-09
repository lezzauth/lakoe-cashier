import 'package:dio/dio.dart';

class WhatsappDioProvider {
  static final Dio _dio =
      Dio(BaseOptions(baseUrl: "http://207.148.117.219:3000/api"));

  Dio get dio {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return _dio;
  }
}
