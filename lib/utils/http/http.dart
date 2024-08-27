import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(baseUrl: "https://api.staging.lakoe.id"))
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));


// class DioHelper {
//   late Dio _dio;

//   DioHelper() {
//     _dio = Dio(BaseOptions(baseUrl: "https://api.staging.lakoe.id"));
//     _dio.interceptors
//         .add(LogInterceptor(requestBody: true, responseBody: true));
//   }
// }
