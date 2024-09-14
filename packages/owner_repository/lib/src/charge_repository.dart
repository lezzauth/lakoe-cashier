import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/src/dto/charge.dart';
import 'package:owner_repository/src/models/charge.dart';
import 'package:token_provider/token_provider.dart';

abstract class ChargeRepository {
  Future<List<ChargeModel>> findAll({required String ownerId});
  Future<ChargeModel> create(
      {required String ownerId, required CreateChargeDto dto});
  Future<ChargeModel> update({
    required String ownerId,
    required String chargeId,
    required UpdateChargeDto dto,
  });
  Future<ChargeModel> delete({
    required String ownerId,
    required String chargeId,
  });
}

class ChargeRepositoryImpl implements ChargeRepository {
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
  Future<List<ChargeModel>> findAll({required String ownerId}) async {
    final options = await _getOptions();
    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/$ownerId/charges",
      options: options,
    );

    return response.data!
        .map((element) => ChargeModel.fromJson(element))
        .toList();
  }

  @override
  Future<ChargeModel> create(
      {required String ownerId, required CreateChargeDto dto}) async {
    final options = await _getOptions();
    final response = await _dio.post(
      "$_baseURL/$ownerId/charges",
      data: dto.toJson(),
      options: options,
    );

    return ChargeModel.fromJson(response.data);
  }

  @override
  Future<ChargeModel> update(
      {required String ownerId,
      required String chargeId,
      required UpdateChargeDto dto}) async {
    final options = await _getOptions();
    final response = await _dio.patch(
      "$_baseURL/$ownerId/charges/$chargeId",
      data: dto.toJson(),
      options: options,
    );

    return ChargeModel.fromJson(response.data);
  }

  @override
  Future<ChargeModel> delete({
    required String ownerId,
    required String chargeId,
  }) async {
    final options = await _getOptions();
    final response = await _dio.delete(
      "$_baseURL/$ownerId/charges/$chargeId",
      options: options,
    );

    return ChargeModel.fromJson(response.data);
  }
}
