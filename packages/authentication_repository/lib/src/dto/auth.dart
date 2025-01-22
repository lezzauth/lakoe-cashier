import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

// Register
@freezed
class OutletDto with _$OutletDto {
  const factory OutletDto({
    required String name,
    required String address,
    required String type,
  }) = _OutletDto;

  factory OutletDto.fromJson(Map<String, Object?> json) =>
      _$OutletDtoFromJson(json);
}

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required String name,
    String? email,
    required String phoneNumber,
    required String pin,
    required OutletDto outlet,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, Object?> json) =>
      _$RegisterDtoFromJson(json);
}

// Request OTP
@freezed
class RequestOTPDto with _$RequestOTPDto {
  const factory RequestOTPDto({
    required String phoneNumber,
  }) = _RequestOTPDto;

  factory RequestOTPDto.fromJson(Map<String, Object?> json) =>
      _$RequestOTPDtoFromJson(json);
}

// Verify OTP
@freezed
class VerifyOTPDto with _$VerifyOTPDto {
  const factory VerifyOTPDto({
    required String phoneNumber,
    required String code,
  }) = _VerifyOTPDto;

  factory VerifyOTPDto.fromJson(Map<String, Object?> json) =>
      _$VerifyOTPDtoFromJson(json);
}

@freezed
class RefreshTokenDto with _$RefreshTokenDto {
  const factory RefreshTokenDto({
    required String token,
  }) = _RefreshTokenDto;

  factory RefreshTokenDto.fromJson(Map<String, Object?> json) =>
      _$RefreshTokenDtoFromJson(json);
}

@freezed
class GenerateTokenDto with _$GenerateTokenDto {
  const factory GenerateTokenDto({
    required String pin,
  }) = _GenerateTokenDto;

  factory GenerateTokenDto.fromJson(Map<String, Object?> json) =>
      _$GenerateTokenDtoFromJson(json);
}
