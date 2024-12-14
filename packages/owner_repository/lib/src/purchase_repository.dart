import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class PurchaseRepository {
  Future<List<HistoryPurchaseModel>> findAll();
}

class PurchaseRepositoryImpl implements PurchaseRepository {
  final String _baseURL = "/owners";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<HistoryPurchaseModel>> findAll() async {
    final Options options = await _getOptions();

    final res = await _dio.get<List<dynamic>>(
      "$_baseURL/purchases",
      options: options,
    );

    return res.data!.map((e) => HistoryPurchaseModel.fromJson(e)).toList();
  }
}
