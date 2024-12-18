import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logman/logman.dart';
import 'package:public_repository/src/dto/bank_list.dart';
import 'package:public_repository/src/models/bank_list.dart';

abstract class PublicRepository {
  Future<List<BankListModel>> findAllBanks();
  Future<GetBankAccountResponse> getBankAccount(GetBankAccountDto dto);
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
  Future<GetBankAccountResponse> getBankAccount(GetBankAccountDto dto) async {
    final String apiKey = dotenv.env['RAPID_API_KEY'] ?? "";

    try {
      final res = await _dio.get(
        "https://cek-nomor-rekening-bank-indonesia1.p.rapidapi.com/cekRekening?${dto.toQueryString()}",
        options: Options(
          headers: {
            'x-rapidapi-key': apiKey,
            'x-rapidapi-host':
                'cek-nomor-rekening-bank-indonesia1.p.rapidapi.com'
          },
        ),
      );

      if (res.data != null && res.data is Map<String, dynamic>) {
        final status = res.data["status"];
        if (status != null && status != "00") {
          throw Exception(
              "Error status: $status, Message: ${res.data["message"]}");
        }

        return GetBankAccountResponse.fromJson(res.data);
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      Logman.instance.error("BANK ACCOUNT ERROR --> $e");
      rethrow;
    }
  }
}
