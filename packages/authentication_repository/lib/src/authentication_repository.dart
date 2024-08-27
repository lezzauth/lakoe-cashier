import 'package:authentication_repository/src/dto/auth.dart';
import 'package:authentication_repository/src/models/auth.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationRepository {
  Future<RegisterResponse> register(RegisterDto dto);
  Future<RequestOTPResponse> requestOTP(RequestOTPDto dto);
  Future<VerifyOTPResponse> verifyOTP(VerifyOTPDto dto);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  String _baseURL = "/auth";
  final Dio _dio;

  AuthenticationRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<RegisterResponse> register(RegisterDto dto) async {
    final response = await _dio.post("$_baseURL/register", data: dto.toJson());
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<RequestOTPResponse> requestOTP(RequestOTPDto dto) async {
    final response =
        await _dio.post("$_baseURL/request-otp", data: dto.toJson());

    return RequestOTPResponse.fromJson(response.data);
  }

  @override
  Future<VerifyOTPResponse> verifyOTP(VerifyOTPDto dto) async {
    final response =
        await _dio.post("$_baseURL/verify-phone", data: dto.toJson());

    return VerifyOTPResponse.fromJson(response.data);
  }
}
