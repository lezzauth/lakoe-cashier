import 'package:category_repository/src/dto/category.dart';
import 'package:category_repository/src/models/category.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> findAll(FindAllCategoryDto dto);
}

class CategoryRepositoryImpl implements CategoryRepository {
  String _baseURL = "/categories";
  final Dio _dio = DioProvider().dio;

  CategoryRepositoryImpl();

  @override
  Future<List<CategoryModel>> findAll(FindAllCategoryDto dto) async {
    final response =
        await _dio.get<List<dynamic>>("$_baseURL?${dto.toQueryString()}");
    return response.data!
        .map((element) => CategoryModel.fromJson(element))
        .toList();
  }
}
