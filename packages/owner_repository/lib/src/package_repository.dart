import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class PackageRepository {
  Future<PackageActive> findOne();
}

class PackageRepositoryImpl implements PackageRepository {
  final String _baseURL = "/owners/package";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<PackageActive> findOne() async {
    final Options options = await _getOptions();

    final response = await _dio.get(_baseURL, options: options);

    return PackageActive.fromJson(response.data);
  }
}
