import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.g.dart';
part 'owner.freezed.dart';

@freezed
class UpdateNameDto with _$UpdateNameDto {
  const factory UpdateNameDto({
    required String name,
  }) = _UpdateNameDto;

  factory UpdateNameDto.fromJson(Map<String, Object?> json) =>
      _$UpdateNameDtoFromJson(json);
}

@freezed
class UpdateEmailDto with _$UpdateEmailDto {
  const factory UpdateEmailDto({
    required String token,
    required String email,
  }) = _UpdateEmailDto;

  factory UpdateEmailDto.fromJson(Map<String, Object?> json) =>
      _$UpdateEmailDtoFromJson(json);
}

@freezed
class UpdatePhoneNumberDto with _$UpdatePhoneNumberDto {
  const factory UpdatePhoneNumberDto({
    required String token,
    required String phoneNumber,
    required String otp,
  }) = _UpdatePhoneNumberDto;

  factory UpdatePhoneNumberDto.fromJson(Map<String, Object?> json) =>
      _$UpdatePhoneNumberDtoFromJson(json);
}

@freezed
class UpdatePinDto with _$UpdatePinDto {
  const factory UpdatePinDto({
    required String token,
    required String pin,
  }) = _UpdatePinDto;

  factory UpdatePinDto.fromJson(Map<String, Object?> json) =>
      _$UpdatePinDtoFromJson(json);
}

@freezed
class RequestOTPDto with _$RequestOTPDto {
  const factory RequestOTPDto({
    required String phoneNumber,
  }) = _RequestOTPDto;

  factory RequestOTPDto.fromJson(Map<String, Object?> json) =>
      _$RequestOTPDtoFromJson(json);
}
