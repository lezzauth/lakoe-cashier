import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class PurchaseRepository {
  Future<List<PurchaseModel>> findAll(FindAllPurchaseDto? dto);
  Future<PurchaseDetail> findOne(String id);
  Future<PurchaseDetail> create({
    required PurchaseDto dto,
    required String? packageName,
  });
}

class PurchaseRepositoryImpl implements PurchaseRepository {
  final String _baseURL = "/owners/purchases";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<PurchaseDetail> create({
    required PurchaseDto dto,
    required String? packageName,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "/packages/$packageName/purchase",
      data: dto.toJson(),
      options: options,
    );
    return PurchaseDetail.fromJson(response.data);
  }

  @override
  Future<List<PurchaseModel>> findAll(FindAllPurchaseDto? dto) async {
    final Options options = await _getOptions();

    final res = await _dio.get<List<dynamic>>(
      "$_baseURL?${dto?.toQueryString()}",
      options: options,
    );

    return res.data!.map((e) => PurchaseModel.fromJson(e)).toList();
  }

  @override
  Future<PurchaseDetail> findOne(String id) async {
    final Options options = await _getOptions();

    final response = await _dio.get(
      "$_baseURL/$id",
      options: options,
    );

    return PurchaseDetail.fromJson(response.data);
  }
}
