import 'dart:io';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:product_repository/product_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll(FindAllProductDto dto);
  Future<ProductModel> findOne(String id);
  Future<ProductModel> create(List<File> images, CreateProductDto dto);
  Future<ProductModel> update(
    String id, {
    List<File>? images,
    required UpdateProductDto dto,
  });
  Future<ListOrderByProductResponse> listOrderByProduct(
    String id,
    ListOrderByProductDto dto,
  );
}

class ProductRepositoryImpl implements ProductRepository {
  final String _baseURL = "/products";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<ProductModel>> findAll(FindAllProductDto dto) async {
    final outletId = await _appDataProvider.outletId;
    final Options options = await _getOptions();

    final response = await _dio.get<List<dynamic>>(
        "$_baseURL?outletId=$outletId&${dto.toQueryString()}",
        options: options);
    return response.data!
        .map((element) => ProductModel.fromJson(element))
        .toList();
  }

  @override
  Future<ProductModel> findOne(String id) async {
    final Options options = await _getOptions();
    final response = await _dio.get(
      "$_baseURL/$id",
      options: options,
    );

    return ProductModel.fromJson(response.data);
  }

  @override
  Future<ProductModel> create(List<File> images, CreateProductDto dto) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    FormData formData =
        FormData.fromMap({...dto.copyWith(outletId: outletId).toJson()});
    for (var image in images) {
      formData.files.add(MapEntry(
          "images",
          await MultipartFile.fromFile(image.path,
              filename: image.path.split("/").last)));
    }
    final response = await _dio.post(
      _baseURL,
      data: formData,
      options: options,
    );
    return ProductModel.fromJson(response.data);
  }

  @override
  Future<ProductModel> update(
    String id, {
    List<File>? images,
    required UpdateProductDto dto,
  }) async {
    final Options options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    FormData formData =
        FormData.fromMap({...dto.copyWith(outletId: outletId).toJsonFilter()});
    if (images != null) {
      for (var image in images) {
        formData.files.add(MapEntry(
            "images",
            await MultipartFile.fromFile(image.path,
                filename: image.path.split("/").last)));
      }
    }

    final response = await _dio.patch(
      "$_baseURL/$id",
      data: formData,
      options: options,
    );
    return ProductModel.fromJson(response.data);
  }

  @override
  Future<ListOrderByProductResponse> listOrderByProduct(
    String id,
    ListOrderByProductDto dto,
  ) async {
    final Options options = await _getOptions();
    final response = await _dio.get(
      "$_baseURL/$id/orders?${dto.toQueryString()}",
      options: options,
    );

    return ListOrderByProductResponse.fromJson(response.data);
  }
}
