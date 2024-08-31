import 'package:dio/dio.dart';

class DioProvider {
  static final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.staging.lakoe.id"));

  Dio get dio => _dio;
}



// class DioHelper {
//   late Dio _dio;

//   DioHelper() {
//     _dio = Dio(BaseOptions(baseUrl: "https://api.staging.lakoe.id"));
//     _dio.interceptors
//         .add(LogInterceptor(requestBody: true, responseBody: true));
//   }
// }
