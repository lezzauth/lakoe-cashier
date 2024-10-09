import 'dart:convert';
import 'dart:developer';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:order_repository/src/dto/order.dart';
import 'package:order_repository/src/models/order.dart';
import 'package:token_provider/token_provider.dart';

abstract class OrderRepository {
  Future<OrderModel> findOne(String id);
  Future<PreviewOrderPriceResponse> previewOrderPrice(PreviewOrderPriceDto dto);
  Future<OrderModelWithoutInclude> addItems(String id, List<OrderItemDto> dto);
}

class OrderRepositoryImpl implements OrderRepository {
  final String _baseURL = "/orders";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

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

  @override
  Future<PreviewOrderPriceResponse> previewOrderPrice(
    PreviewOrderPriceDto dto,
  ) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(
      "$_baseURL/price-preview",
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );

    return PreviewOrderPriceResponse.fromJson(response.data);
  }

  @override
  Future<OrderModelWithoutInclude> addItems(
    String id,
    List<OrderItemDto> dto,
  ) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/$id/items",
      data: jsonEncode(dto.map((e) => e.toJson()).toList()),
      options: options,
    );

    log('addItems: $response');

    return OrderModelWithoutInclude.fromJson(response.data);
  }
}
