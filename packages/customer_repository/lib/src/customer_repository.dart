import 'package:customer_repository/src/dto/customer.dart';
import 'package:customer_repository/src/models/customer.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:token_provider/token_provider.dart';

abstract class CashierRepository {
  Future<List<CustomerModel>> findAll(FindAllCustomerDto dto);
}

class CashierRepositoryImpl implements CashierRepository {
  String _baseURL = "/customers";
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
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<CustomerModel>> findAll(FindAllCustomerDto dto) async {
    final options = await _getOptions();

    final response = await _dio.get<List<dynamic>>(
        "$_baseURL&${dto.toQueryString()}",
        options: options);

    return response.data!
        .map((response) => CustomerModel.fromJson(response))
        .toList();
  }
}
