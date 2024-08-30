import 'package:cashier_repository/src/dto/cashier.dart';
import 'package:cashier_repository/src/models/cashier.dart';
import 'package:dio/dio.dart';
import 'package:token_provider/token_provider.dart';

abstract class CashierRepository {
  Future<OpenCashierResponse> openCashier(OpenCashierDto dto);
  Future<CashierModel> closeCashier(CloseCashierDto dto);
  Future<GetOpenCashierResponse?> getOpenCashier(String outletId);
  Future<PreviewOrderPriceResponse> previewOrderPrice(PreviewOrderPriceDto dto);
  Future<SaveOrderResponse> saveOrder(SaveOrderDto dto);
}

class CashierRepositoryImp implements CashierRepository {
  String _baseURL = "/cashier";
  final Dio _dio;
  final TokenProvider _tokenProvider;

  CashierRepositoryImp({required Dio dio, required TokenProvider tokenProvider})
      : _dio = dio,
        _tokenProvider = tokenProvider {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenProvider.getAppToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Handle token refresh logic here
          }
          handler.next(error);
        },
      ),
    );
  }

  @override
  Future<OpenCashierResponse> openCashier(OpenCashierDto dto) async {
    final response = await _dio.post("$_baseURL/open", data: dto.toJson());
    return OpenCashierResponse.fromJson(response.data);
  }

  @override
  Future<CashierModel> closeCashier(CloseCashierDto dto) async {
    final response = await _dio.post("$_baseURL/close", data: dto.toJson());
    return CashierModel.fromJson(response.data);
  }

  @override
  Future<GetOpenCashierResponse?> getOpenCashier(String outletId) async {
    final response = await _dio.get("$_baseURL/open?outletId=$outletId");
    if (response.statusCode == 204) return null;
    return GetOpenCashierResponse.fromJson(response.data);
  }

  @override
  Future<PreviewOrderPriceResponse> previewOrderPrice(
      PreviewOrderPriceDto dto) async {
    final response =
        await _dio.post("$_baseURL/price-preview", data: dto.toJson());
    return PreviewOrderPriceResponse.fromJson(response.data);
  }

  @override
  Future<SaveOrderResponse> saveOrder(SaveOrderDto dto) async {
    final response =
        await _dio.post("$_baseURL/save-order", data: dto.toJson());
    return SaveOrderResponse.fromJson(response.data);
  }
}
