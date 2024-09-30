import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/src/dto/charge.dart';
import 'package:owner_repository/src/models/charge.dart';
import 'package:token_provider/token_provider.dart';

abstract class ChargeRepository {
  Future<List<ChargeModel>> findAll();
  Future<ChargeModel> create({required CreateChargeDto dto});
  Future<ChargeModel> update({
    required String chargeId,
    required UpdateChargeDto dto,
  });
  Future<ChargeModel> delete({
    required String chargeId,
  });
}

class ChargeRepositoryImpl implements ChargeRepository {
  final String _baseURL = "/owners";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<ChargeModel>> findAll() async {
    final options = await _getOptions();
    final ownerId = await _appDataProvider.ownerId;

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/$ownerId/charges",
      options: options,
    );

    return response.data!
        .map((element) => ChargeModel.fromJson(element))
        .toList();
  }

  @override
  Future<ChargeModel> create({
    required CreateChargeDto dto,
  }) async {
    final options = await _getOptions();
    final ownerId = await _appDataProvider.ownerId;

    final response = await _dio.post(
      "$_baseURL/$ownerId/charges",
      data: dto.toJson(),
      options: options,
    );

    return ChargeModel.fromJson(response.data);
  }

  @override
  Future<ChargeModel> update({
    required String chargeId,
    required UpdateChargeDto dto,
  }) async {
    final options = await _getOptions();
    final ownerId = await _appDataProvider.ownerId;

    final response = await _dio.patch(
      "$_baseURL/$ownerId/charges/$chargeId",
      data: dto.toJson(),
      options: options,
    );

    return ChargeModel.fromJson(response.data);
  }

  @override
  Future<ChargeModel> delete({
    required String chargeId,
  }) async {
    final options = await _getOptions();
    final ownerId = await _appDataProvider.ownerId;

    final response = await _dio.delete(
      "$_baseURL/$ownerId/charges/$chargeId",
      options: options,
    );

    return ChargeModel.fromJson(response.data);
  }
}
