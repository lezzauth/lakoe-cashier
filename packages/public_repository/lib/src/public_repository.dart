import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:public_repository/src/dto/bank_list.dart';
import 'package:public_repository/src/models/bank_list.dart';

abstract class PublicRepository {
  Future<List<BankListModel>> findAllBanks();
  Future<BankAccountModel> getBankAccount(GetBankAccountDto dto);
}

class PublicRepositoryImpl implements PublicRepository {
  final String _baseURL = "/public";
  final Dio _dio = DioProvider().dio;

  @override
  Future<List<BankListModel>> findAllBanks() async {
    final response = await _dio.get<List<dynamic>>("$_baseURL/banks");

    final data = response.data!
        .map((element) => BankListModel.fromJson(element))
        .toList();
    data.length = data.length - 3;
    return data;
  }

  @override
  Future<BankAccountModel> getBankAccount(GetBankAccountDto dto) async {
    final response = await _dio.get(
      "https://api-rekening.lfourr.com/getBankAccount?${dto.toQueryString()}",
    );

    final data = GetBankAccountResponse.fromJson(response.data);
    return data.data;
  }
}
