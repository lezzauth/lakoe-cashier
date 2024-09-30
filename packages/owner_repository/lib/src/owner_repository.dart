import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:owner_repository/src/charge_repository.dart';
import 'package:owner_repository/src/models/owner.dart';
import 'package:owner_repository/src/owner_bank_repository.dart';
import 'package:owner_repository/src/tax_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class OwnerRepository {
  OwnerBankRepository get bank;
  TaxRepository get tax;
  ChargeRepository get charge;
  Future<List<OutletModel>> listOutlets();
  Future<OwnerProfileModel> getProfile();
}

class OwnerRepositoryImpl implements OwnerRepository {
  final String _baseURL = "/owners";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  @override
  OwnerBankRepository get bank => OwnerBankRepositoryImpl();

  @override
  TaxRepository get tax => TaxRepositoryImpl();

  @override
  ChargeRepository get charge => ChargeRepositoryImpl();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<OwnerProfileModel> getProfile() async {
    final Options options = await _getOptions();

    final response = await _dio.get(
      "$_baseURL/profile",
      options: options,
    );
    return OwnerProfileModel.fromJson(response.data);
  }

  @override
  Future<List<OutletModel>> listOutlets() async {
    final Options options = await _getOptions();
    final profile = await getProfile();

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL/${profile.id}/outlets",
      options: options,
    );

    return response.data!
        .map((element) => OutletModel.fromJson(element))
        .toList();
  }
}
