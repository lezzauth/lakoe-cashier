import 'package:category_repository/src/dto/category.dart';
import 'package:category_repository/src/models/category.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:token_provider/token_provider.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> findAll(FindAllCategoryDto dto);
  Future<CategoryModel> create(CreateCategoryDto dto);
  Future<CategoryModel> update(int id, UpdateCategoryDto dto);
}

class CategoryRepositoryImpl implements CategoryRepository {
  String _baseURL = "/categories";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<CategoryModel>> findAll(FindAllCategoryDto dto) async {
    final response =
        await _dio.get<List<dynamic>>("$_baseURL?${dto.toQueryString()}");
    return response.data!
        .map((element) => CategoryModel.fromJson(element))
        .toList();
  }

  @override
  Future<CategoryModel> create(CreateCategoryDto dto) async {
    final options = await _getOptions();

    final response =
        await _dio.post(_baseURL, data: dto.toJson(), options: options);
    return CategoryModel.fromJson(response.data);
  }

  @override
  Future<CategoryModel> update(int id, UpdateCategoryDto dto) async {
    final options = await _getOptions();

    final response =
        await _dio.patch("$_baseURL/$id", data: dto.toJson(), options: options);
    return CategoryModel.fromJson(response.data);
  }
}
