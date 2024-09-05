import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:outlet_repository/src/dto/outlet.dart';
import 'package:outlet_repository/src/models/outlet.dart';
import 'package:token_provider/token_provider.dart';

abstract class OutletRepository {
  Future<DetailCustomerOutletResponse> detailCustomerOutlet({
    required String outletId,
    required String customerId,
    DetailCustomerOutletDto? dto,
  });
}

class OutletRepositoryImpl implements OutletRepository {
  String _baseURL = "/outlets";
  Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  OwnerRepositoryImpl() {
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
  Future<DetailCustomerOutletResponse> detailCustomerOutlet({
    required String outletId,
    required String customerId,
    DetailCustomerOutletDto? dto,
  }) async {
    final options = await _getOptions();
    final response = await _dio.get(
      "$_baseURL/$outletId/customers/$customerId?${dto == null ? "" : dto.toQueryString()}",
      options: options,
    );
    return DetailCustomerOutletResponse.fromJson(response.data);
  }
}
