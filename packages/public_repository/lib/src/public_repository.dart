import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:public_repository/src/models/bank_list.dart';

abstract class PublicRepository {
  Future<List<BankListModel>> findAllBanks();
}

class PublicRepositoryImpl implements PublicRepository {
  String _baseURL = "/public";
  Dio _dio = DioProvider().dio;

  @override
  Future<List<BankListModel>> findAllBanks() async {
    final response = await _dio.get<List<dynamic>>("$_baseURL/banks");

    return response.data!
        .map((element) => BankListModel.fromJson(element))
        .toList();
  }
}
