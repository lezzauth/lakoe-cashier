import 'package:category_repository/src/dto/category.dart';
import 'package:category_repository/src/models/category.dart';
import 'package:dio/dio.dart';
import 'package:token_provider/token_provider.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> findAll(FindAllCategoryDto dto);
}

class CategoryRepositoryImp implements CategoryRepository {
  String _baseURL = "/categories";
  final Dio _dio;
  final TokenProvider _tokenProvider;

  CategoryRepositoryImp(
      {required Dio dio, required TokenProvider tokenProvider})
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
  Future<List<CategoryModel>> findAll(FindAllCategoryDto dto) async {
    final response =
        await _dio.get<List<dynamic>>("$_baseURL?${dto.toQueryString()}");
    return response.data!
        .map((element) => CategoryModel.fromJson(element))
        .toList();
  }
}
