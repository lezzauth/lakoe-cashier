import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:package_repository/package_repository.dart';
import 'package:package_repository/src/models/package.dart';
import 'package:package_repository/src/purchase_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class PackageRepository {
  PurchaseRepository get purchase;

  Future<List<PackageModel>> findAll();
  Future<List<PackagePriceModel>> findOne(String name);
  Future<PurchaseModel> create({
    required PurchaseDto dto,
    required String? packageName,
  });
}

class PackageRepositoryImpl implements PackageRepository {
  final String _baseURL = "/packages";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  @override
  PurchaseRepository get purchase => PurchaseRepositoryImpl();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<PackageModel>> findAll() async {
    final Options options = await _getOptions();

    final response = await _dio.get<List<dynamic>>(_baseURL, options: options);
    return response.data!
        .map((element) => PackageModel.fromJson(element))
        .toList();
  }

  @override
  Future<List<PackagePriceModel>> findOne(String name) async {
    final Options options = await _getOptions();

    final response =
        await _dio.get<List<dynamic>>("$_baseURL/$name", options: options);

    return response.data!
        .map((element) => PackagePriceModel.fromJson(element))
        .toList();
  }

  @override
  Future<PurchaseModel> create({
    required PurchaseDto dto,
    required String? packageName,
  }) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/$packageName/purchase",
      data: dto.toJson(),
      options: options,
    );
    return PurchaseModel.fromJson(response.data);
  }
}