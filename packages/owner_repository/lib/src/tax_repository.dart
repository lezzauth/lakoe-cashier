import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/src/dto/tax.dart';
import 'package:owner_repository/src/models/tax.dart';
import 'package:token_provider/token_provider.dart';

abstract class TaxRepository {
  Future<List<TaxModel>> findAll({required String ownerId});
  Future<TaxModel> create({required String ownerId, required CreateTaxDto dto});
  Future<TaxModel> update({
    required String ownerId,
    required String taxId,
    required UpdateTaxDto dto,
  });
  Future<TaxModel> delete({
    required String ownerId,
    required String taxId,
  });
}

class TaxRepositoryImpl implements TaxRepository {
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
  Future<List<TaxModel>> findAll({required String ownerId}) async {
    final options = await _getOptions();
    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/$ownerId/taxes",
      options: options,
    );

    return response.data!.map((element) => TaxModel.fromJson(element)).toList();
  }

  @override
  Future<TaxModel> create(
      {required String ownerId, required CreateTaxDto dto}) async {
    final options = await _getOptions();
    final response = await _dio.post(
      "$_baseURL/$ownerId/taxes",
      data: dto.toJson(),
      options: options,
    );

    return TaxModel.fromJson(response.data);
  }

  @override
  Future<TaxModel> update(
      {required String ownerId,
      required String taxId,
      required UpdateTaxDto dto}) async {
    final options = await _getOptions();
    final response = await _dio.patch(
      "$_baseURL/$ownerId/taxes/$taxId",
      data: dto.toJson(),
      options: options,
    );

    return TaxModel.fromJson(response.data);
  }

  @override
  Future<TaxModel> delete({
    required String ownerId,
    required String taxId,
  }) async {
    final options = await _getOptions();
    final response = await _dio.delete(
      "$_baseURL/$ownerId/taxes/$taxId",
      options: options,
    );

    return TaxModel.fromJson(response.data);
  }
}
