import 'package:flutter/material.dart';
import 'package:authentication_repository/src/dto/auth.dart';
import 'package:authentication_repository/src/models/auth.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:token_provider/token_provider.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/app.dart';

abstract class AuthenticationRepository {
  Future<RegisterResponse> register(RegisterDto dto);
  Future<RequestOTPResponse> requestOTP(RequestOTPDto dto);
  Future<VerifyOTPResponse> verifyOTP(VerifyOTPDto dto);
  Future<RefreshTokenRes> refreshToken(RefreshTokenDto dto);
  Future<GenerateTokenRes> generateToken(GenerateTokenDto dto);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final String _baseURL = "/auth";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  AuthenticationRepositoryImpl() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
          } else if (error.response?.statusCode == 429) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (navigatorKey.currentContext != null) {
                CustomToast.showWithContext(
                  navigatorKey.currentContext!,
                  "Tunggu sebentar ya…",
                  icon: TIcons.warning,
                  position: "bottom",
                  duration: 2,
                );
              }
            });
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
  Future<RegisterResponse> register(RegisterDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/register",
      data: dto.toJson(),
      options: options,
    );
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<RequestOTPResponse> requestOTP(RequestOTPDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/request-otp",
      data: dto.toJson(),
      options: options,
    );

    return RequestOTPResponse.fromJson(response.data);
  }

  @override
  Future<VerifyOTPResponse> verifyOTP(VerifyOTPDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/verify-phone",
      data: dto.toJson(),
      options: options,
    );

    return VerifyOTPResponse.fromJson(response.data);
  }

  @override
  Future<RefreshTokenRes> refreshToken(RefreshTokenDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/refresh-token",
      data: dto.toJson(),
      options: options,
    );

    return RefreshTokenRes.fromJson(response.data);
  }

  @override
  Future<GenerateTokenRes> generateToken(GenerateTokenDto dto) async {
    final Options options = await _getOptions();

    final response = await _dio.post(
      "$_baseURL/generate-otp",
      data: dto.toJson(),
      options: options,
    );

    return GenerateTokenRes.fromJson(response.data);
  }
}
