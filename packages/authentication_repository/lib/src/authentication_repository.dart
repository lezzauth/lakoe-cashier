import 'package:authentication_repository/src/dto/auth.dart';
import 'package:authentication_repository/src/models/auth.dart';
import 'package:dio/dio.dart';
import 'package:token_provider/token_provider.dart';

abstract class AuthenticationRepository {
  Future<RegisterResponse> register(RegisterDto dto);
  Future<RequestOTPResponse> requestOTP(RequestOTPDto dto);
  Future<VerifyOTPResponse> verifyOTP(VerifyOTPDto dto);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  String _baseURL = "/auth";
  final Dio _dio;
  final TokenProvider _tokenProvider;

  AuthenticationRepositoryImpl(
      {required Dio dio, required TokenProvider tokenProvider})
      : _dio = dio,
        _tokenProvider = tokenProvider {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _tokenProvider.getAuthToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          // Handle token refresh logic here
        }
        handler.next(error);
      },
    ));
  }

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
