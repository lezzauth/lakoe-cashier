import 'dart:convert';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:cashier_repository/src/dto/cashier.dart';
import 'package:cashier_repository/src/models/cashier.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:order_repository/order_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class CashierRepository {
  Future<OpenCashierResponse> openCashier(OpenCashierDto dto);
  Future<CashierModel> closeCashier(CloseCashierDto dto);
  Future<GetOpenCashierResponse?> getOpenCashier();
  Future<RegenerateCashierTokenRes> regenerateToken(
      RegenerateCashierTokenDto dto);

  // orders
  Future<SaveOrderResponse> saveOrder(SaveOrderDto dto);
  Future<CompleteOrderRes> saveAndCompleteOrder(
    SaveOrderDto saveOrderDto,
    CompleteOrderDto completeOrderDto,
  );
  Future<CompleteOrderRes> completeOrder(String id, CompleteOrderDto dto);
  Future<CancelOrderResponse> cancelOrder(String id);
  Future<List<OrderCashierItemRes>> findAllOrderCashier(
      FindAllOrderCashierDto? dto);
  Future<OrderModelWithoutInclude> editOrder(String id, List<OrderItemDto> dto);
}

class CashierRepositoryImpl implements CashierRepository {
  final String _baseURL = "/cashier";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final tokenCashier = await _tokenProvider.getCashierToken();
    final tokenAuth = await _tokenProvider.getAuthToken();
    if (tokenCashier == null && tokenAuth == null) return Options();

    if (tokenCashier == null) {
      return Options(headers: {"Authorization": "Bearer $tokenAuth"});
    }

    return Options(headers: {"Authorization": "Bearer $tokenCashier"});
  }

  @override
  Future<OpenCashierResponse> openCashier(OpenCashierDto dto) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final res = await _dio.post(
      "$_baseURL/open",
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );

    return OpenCashierResponse.fromJson(res.data);
  }

  @override
  Future<CashierModel> closeCashier(CloseCashierDto dto) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(
      "$_baseURL/close",
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );
    return CashierModel.fromJson(response.data);
  }

  @override
  Future<GetOpenCashierResponse?> getOpenCashier() async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.get(
      "$_baseURL/open?outletId=$outletId",
      options: options,
    );
    if (response.statusCode == 204) return null;
    return GetOpenCashierResponse.fromJson(response.data);
  }

  @override
  Future<RegenerateCashierTokenRes> regenerateToken(
      RegenerateCashierTokenDto dto) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(
      "$_baseURL/generate-token",
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );
    return RegenerateCashierTokenRes.fromJson(response.data);
  }

  // orders

  @override
  Future<SaveOrderResponse> saveOrder(SaveOrderDto dto) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(
      "$_baseURL/save-order",
      data: dto.copyWith(outletId: outletId).toJson(),
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
  Future<CompleteOrderRes> saveAndCompleteOrder(
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
    return CompleteOrderRes.fromJson(response.data);
  }

  @override
  Future<CompleteOrderRes> completeOrder(
    String id,
    CompleteOrderDto dto,
  ) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/orders/$id/complete",
      data: await _completeOrderDto(dto),
      options: options,
    );
    return CompleteOrderRes.fromJson(response.data);
  }

  @override
  Future<CancelOrderResponse> cancelOrder(String id) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/orders/$id/cancel",
      options: options,
    );
    return CancelOrderResponse.fromJson(response.data);
  }

  @override
  Future<List<OrderCashierItemRes>> findAllOrderCashier(
      FindAllOrderCashierDto? dto) async {
    final Options options = await _getOptions();

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/orders?${dto?.toQueryString()}",
      options: options,
    );
    return response.data!
        .map((item) => OrderCashierItemRes.fromJson(item))
        .toList();
  }

  @override
  Future<OrderModelWithoutInclude> editOrder(
    String id,
    List<OrderItemDto> dto,
  ) async {
    final Options options = await _getOptions();

    final response = await _dio.patch(
      "$_baseURL/orders/$id/items",
      data: jsonEncode(dto.map((e) => e.toJson()).toList()),
      options: options,
    );

    return OrderModelWithoutInclude.fromJson(response.data);
  }
}
