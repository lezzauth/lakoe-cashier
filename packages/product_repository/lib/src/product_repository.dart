import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:product_repository/product_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll(FindAllProductDto dto);
  Future<ProductModel> create(List<File> images, CreateProductDto dto);
}

class ProductRepositoryImpl implements ProductRepository {
  String _baseURL = "/products";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  ProductRepositoryImpl();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<ProductModel>> findAll(FindAllProductDto dto) async {
    final response =
        await _dio.get<List<dynamic>>("$_baseURL?${dto.toQueryString()}");
    return response.data!
        .map((element) => ProductModel.fromJson(element))
        .toList();
  }

  @override
  Future<ProductModel> create(List<File> images, CreateProductDto dto) async {
    final Options options = await _getOptions();

    FormData formData = FormData.fromMap({...dto.toJson()});
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
}
