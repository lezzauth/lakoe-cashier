import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:owner_repository/src/charge_repository.dart';
import 'package:owner_repository/src/dto/owner.dart';
import 'package:owner_repository/src/models/owner.dart';
import 'package:owner_repository/src/owner_bank_repository.dart';
import 'package:owner_repository/src/package_repository.dart';
import 'package:owner_repository/src/purchase_repository.dart';
import 'package:owner_repository/src/tax_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class OwnerRepository {
  OwnerBankRepository get bank;
  TaxRepository get tax;
  ChargeRepository get charge;
  PurchaseRepository get purchase;
  PackageRepository get package;
  Future<List<OutletModel>> listOutlets();
  Future<OwnerProfileModel> getProfile();
  Future<UpdateOwnerModel> updateNameAccount(UpdateNameDto dto);
  Future<UpdateOwnerModel> updateEmailAccount(UpdateEmailDto dto);
  Future<UpdateOwnerModel> updatePINAccount(UpdatePinDto dto);
  Future<RequestOTPRes> requestOTP(RequestOTPDto dto);
  Future<UpdateOwnerModel> updatePhoneNumber(UpdatePhoneNumberDto dto);
  Future<DeleteAccountRes> deleteAccount(DeleteAccountDto dto);
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

  @override
  PurchaseRepository get purchase => PurchaseRepositoryImpl();

  @override
  PackageRepository get package => PackageRepositoryImpl();

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
  Future<UpdateOwnerModel> updateNameAccount(UpdateNameDto dto) async {
    final Options options = await _getOptions();

    final res = await _dio.patch(
      "$_baseURL/profile",
      data: dto.toJson(),
      options: options,
    );

    return UpdateOwnerModel.fromJson(res.data);
  }

  @override
  Future<UpdateOwnerModel> updateEmailAccount(UpdateEmailDto dto) async {
    final Options options = await _getOptions();

    final res = await _dio.patch(
      "$_baseURL/profile",
      data: dto.toJson(),
      options: options,
    );

    return UpdateOwnerModel.fromJson(res.data);
  }

  @override
  Future<UpdateOwnerModel> updatePINAccount(UpdatePinDto dto) async {
    final Options options = await _getOptions();

    final res = await _dio.patch(
      "$_baseURL/profile",
      data: dto.toJson(),
      options: options,
    );

    return UpdateOwnerModel.fromJson(res.data);
  }

  @override
  Future<RequestOTPRes> requestOTP(RequestOTPDto dto) async {
    final Options options = await _getOptions();

    final res = await _dio.patch(
      "$_baseURL/profile/otp",
      data: dto.toJson(),
      options: options,
    );

    return RequestOTPRes.fromJson(res.data);
  }

  @override
  Future<UpdateOwnerModel> updatePhoneNumber(UpdatePhoneNumberDto dto) async {
    final Options options = await _getOptions();

    final res = await _dio.patch(
      "$_baseURL/profile",
      data: dto.toJson(),
      options: options,
    );

    return UpdateOwnerModel.fromJson(res.data);
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

  @override
  Future<DeleteAccountRes> deleteAccount(DeleteAccountDto dto) async {
    final Options options = await _getOptions();

    final res = await _dio.delete(
      "$_baseURL/profile",
      data: dto.toJson(),
      options: options,
    );

    return DeleteAccountRes.fromJson(res.data);
  }
}
