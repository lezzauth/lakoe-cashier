import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required String token,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, Object?> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
class RequestOTPResponse with _$RequestOTPResponse {
  const factory RequestOTPResponse({
    required String id,
    required String target,
    required String type,
    required String action,
    required String createdAt,
    required String updatedAt,
  }) = _RequestOTPResponse;

  factory RequestOTPResponse.fromJson(Map<String, Object?> json) =>
      _$RequestOTPResponseFromJson(json);
}

@freezed
class VerifyOTPResponse with _$VerifyOTPResponse {
  const factory VerifyOTPResponse({
    required String action,
    required String token,
  }) = _VerifyOTPResponse;

  factory VerifyOTPResponse.fromJson(Map<String, Object?> json) =>
      _$VerifyOTPResponseFromJson(json);
}
