import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:owner_repository/src/models/owner.dart';
import 'package:token_provider/token_provider.dart';

abstract class OwnerRepository {
  Future<List<OutletModel>> listOutlets();
  Future<OwnerProfileModel> getProfile();
}

class OwnerRepositoryImpl implements OwnerRepository {
  String _baseURL = "/owners";
  Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  OwnerRepositoryImpl() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Handle token refresh logic here
          }
          handler.next(error);
        },
      ),
    );
  }

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<OwnerProfileModel> getProfile() async {
    final Options options = await _getOptions();

    final response = await _dio.get(
      "$_baseURL/profile",
      options: options,
    );
    return OwnerProfileModel.fromJson(response.data);
  }

  @override
  Future<List<OutletModel>> listOutlets() async {
    final Options options = await _getOptions();

    final profile = await getProfile();

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/${profile.id}/outlets",
      options: options,
    );

    return response.data!
        .map((element) => OutletModel.fromJson(element))
        .toList();
  }
}