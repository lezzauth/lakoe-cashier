import 'package:dio/dio.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:owner_repository/src/models/owner.dart';
import 'package:token_provider/token_provider.dart';

abstract class OwnerRepository {
  Future<List<OutletModel>> listOutlets();
  Future<OwnerProfileModel> getProfile();
}

class OwnerRepositoryImpl implements OwnerRepository {
  String _baseURL = "/owners";
  final Dio _dio;
  final TokenProvider _tokenProvider;

  OwnerRepositoryImpl({required Dio dio, required TokenProvider tokenProvider})
      : _dio = dio,
        _tokenProvider = tokenProvider {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenProvider.getAuthToken();
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
  Future<OwnerProfileModel> getProfile() async {
    final response = await _dio.get("$_baseURL/profile");
    return OwnerProfileModel.fromJson(response.data);
  }

  @override
  Future<List<OutletModel>> listOutlets() async {
    final profile = await getProfile();
    final response = await _dio
        .get<List<dynamic>>("$_baseURL/profile/${profile.id}/outlets");

    return response.data!
        .map((element) => OutletModel.fromJson(element))
        .toList();
  }
}
