import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:order_repository/src/models/order.dart';
import 'package:token_provider/token_provider.dart';

abstract class OrderRepository {
  Future<OrderModel> findOne(String id);
}

class OrderRepositoryImpl implements OrderRepository {
  String _baseURL = "/orders";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  CashierRepositoryImpl() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Handle token refresh logic here
          }
          handler.next(error);
        },
      ),
    );
  }

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getCashierToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<OrderModel> findOne(String id) async {
    final options = await _getOptions();
    final response = await _dio.get("$_baseURL/$id", options: options);

    return OrderModel.fromJson(response.data);
  }
}