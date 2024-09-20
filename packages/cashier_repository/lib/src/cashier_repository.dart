import 'package:cashier_repository/src/dto/cashier.dart';
import 'package:cashier_repository/src/models/cashier.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:token_provider/token_provider.dart';

abstract class CashierRepository {
  Future<OpenCashierResponse> openCashier(OpenCashierDto dto);
  Future<CashierModel> closeCashier(CloseCashierDto dto);
  Future<GetOpenCashierResponse?> getOpenCashier(String outletId);
  Future<RegenerateCashierTokenResponse> regenerateToken(
      RegenerateCashierTokenDto dto);

  // orders
  Future<SaveOrderResponse> saveOrder(SaveOrderDto dto);
  Future<CompleteOrderResponse> saveAndCompleteOrder(
    SaveOrderDto saveOrderDto,
    CompleteOrderDto completeOrderDto,
  );
  Future<CompleteOrderResponse> completeOrder(
    String id,
    CompleteOrderDto dto,
  );
  Future<List<OrderItemResponse>> findAllOrder(FindAllOrderDto? dto);
}

class CashierRepositoryImpl implements CashierRepository {
  String _baseURL = "/cashier";
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
  Future<OpenCashierResponse> openCashier(OpenCashierDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/open",
      data: dto.toJson(),
      options: options,
    );
    return OpenCashierResponse.fromJson(response.data);
  }

  @override
  Future<CashierModel> closeCashier(CloseCashierDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/close",
      data: dto.toJson(),
      options: options,
    );
    return CashierModel.fromJson(response.data);
  }

  @override
  Future<GetOpenCashierResponse?> getOpenCashier(String outletId) async {
    final Options options = await _getOptions();

    final response = await _dio.get(
      "$_baseURL/open?outletId=$outletId",
      options: options,
    );
    if (response.statusCode == 204) return null;
    return GetOpenCashierResponse.fromJson(response.data);
  }

  @override
  Future<RegenerateCashierTokenResponse> regenerateToken(
      RegenerateCashierTokenDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/generate-token",
      data: dto.toJson(),
      options: options,
    );
    return RegenerateCashierTokenResponse.fromJson(response.data);
  }

  // orders

  @override
  Future<SaveOrderResponse> saveOrder(SaveOrderDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/save-order",
      data: dto.toJson(),
      options: options,
    );
    return SaveOrderResponse.fromJson(response.data);
  }

  Future<Object?> _completeOrderDto(CompleteOrderDto dto) async {
    if (dto is CompleteCashOrderDto) return dto.toJson();
    if (dto is CompleteDebitCreditOrderDto) return dto.toJson();
    if (dto is CompleteQRCodeOrderDto) return dto.toJson();

    if (dto is CompleteBankTransferOrderDto) {
      FormData formData = FormData.fromMap({...dto.data.toJson()});
      formData.files.add(MapEntry(
          "photo",
          await MultipartFile.fromFile(dto.photo.path,
              filename: dto.photo.path.split("/").last)));

      return formData;
    }

    return null;
  }

  @override
  Future<CompleteOrderResponse> saveAndCompleteOrder(
    SaveOrderDto saveOrderDto,
    CompleteOrderDto completeOrderDto,
  ) async {
    final Options options = await _getOptions();
    final saveOrderResponse = await saveOrder(saveOrderDto);

    final response = await _dio.post(
      "$_baseURL/orders/${saveOrderResponse.id}/complete",
      data: await _completeOrderDto(completeOrderDto),
      options: options,
    );
    return CompleteOrderResponse.fromJson(response.data);
  }

  @override
  Future<CompleteOrderResponse> completeOrder(
    String id,
    CompleteOrderDto dto,
  ) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/orders/${id}/complete",
      data: await _completeOrderDto(dto),
      options: options,
    );
    return CompleteOrderResponse.fromJson(response.data);
  }

  @override
  Future<List<OrderItemResponse>> findAllOrder(FindAllOrderDto? dto) async {
    final Options options = await _getOptions();

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/orders?${dto?.toQueryString()}",
      options: options,
    );
    return response.data!
        .map((item) => OrderItemResponse.fromJson(item))
        .toList();
  }
}
