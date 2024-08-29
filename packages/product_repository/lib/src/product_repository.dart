import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_repository/product_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll(FindAllProductDto dto);
  Future<ProductModel> create(List<File> images, CreateProductDto dto);
}

class ProductRepositoryImp implements ProductRepository {
  String _baseURL = "/products";
  final Dio _dio;
  final TokenProvider _tokenProvider;

  ProductRepositoryImp({required Dio dio, required TokenProvider tokenProvider})
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
  Future<List<ProductModel>> findAll(FindAllProductDto dto) async {
    final response =
        await _dio.get<List<dynamic>>("$_baseURL?${dto.toQueryString()}");
    return response.data!
        .map((element) => ProductModel.fromJson(element))
        .toList();
  }

  @override
  Future<ProductModel> create(List<File> images, CreateProductDto dto) async {
    FormData formData = FormData.fromMap({...dto.toJson()});
    for (var image in images) {
      formData.files.add(MapEntry(
          "images",
          await MultipartFile.fromFile(image.path,
              filename: image.path.split("/").last)));
    }
    final response = await _dio.post(_baseURL, data: formData);
    return ProductModel.fromJson(response.data);
  }
}
