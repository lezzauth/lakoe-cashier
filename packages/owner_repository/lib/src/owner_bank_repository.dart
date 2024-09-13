import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/src/dto/bank.dart';
import 'package:owner_repository/src/models/bank.dart';
import 'package:token_provider/token_provider.dart';

abstract class OwnerBankRepository {
  Future<List<OwnerBankModel>> findAll({
    required String ownerId,
  });
  Future<OwnerBankModel> create({
    required String ownerId,
    required CreateOwnerBankDto dto,
  });
  Future<OwnerBankModel> update({
    required String ownerId,
    required String bankId,
    required UpdateOwnerBankDto dto,
  });
  Future<OwnerBankModel> delete({
    required String ownerId,
    required String bankId,
  });
}

class OwnerBankRepositoryImpl implements OwnerBankRepository {
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
  Future<OwnerBankModel> create({
    required String ownerId,
    required CreateOwnerBankDto dto,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/$ownerId/banks",
      data: dto.toJson(),
      options: options,
    );

    return OwnerBankModel.fromJson(response.data);
  }

  @override
  Future<OwnerBankModel> delete({
    required String ownerId,
    required String bankId,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.delete(
      "$_baseURL/$ownerId/banks/$bankId",
      options: options,
    );

    return OwnerBankModel.fromJson(response.data);
  }

  @override
  Future<List<OwnerBankModel>> findAll({
    required String ownerId,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.get<List<dynamic>>("$_baseURL/$ownerId/banks",
        options: options);

    return response.data!
        .map((element) => OwnerBankModel.fromJson(element))
        .toList();
  }

  @override
  Future<OwnerBankModel> update({
    required String ownerId,
    required String bankId,
    required UpdateOwnerBankDto dto,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.patch(
      "$_baseURL/$ownerId/banks/$bankId",
      data: dto.toJson(),
      options: options,
    );

    return OwnerBankModel.fromJson(response.data);
  }
}
