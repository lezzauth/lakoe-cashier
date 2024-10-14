import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:package_repository/package_repository.dart';
import 'package:package_repository/src/models/package.dart';
import 'package:token_provider/token_provider.dart';

abstract class PurchaseRepository {
  Future<PurchaseResponseModel> create({
    required PurchaseDto dto,
    required String? packageName,
  });
}

class PurchaseRepositoryImpl implements PurchaseRepository {
  final String _baseURL = "/packages";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<PurchaseResponseModel> create({
    required PurchaseDto dto,
    required String? packageName,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/$packageName/purchase",
      data: dto.toJson(),
      options: options,
    );
    return PurchaseResponseModel.fromJson(response.data);
  }
}
