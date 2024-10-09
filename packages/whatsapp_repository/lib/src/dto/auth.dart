import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
class WAAuthRequestCodeDto with _$WAAuthRequestCodeDto {
  const factory WAAuthRequestCodeDto({
    required String phoneNumber,
  }) = _WAAuthRequestCodeDto;

  factory WAAuthRequestCodeDto.fromJson(Map<String, Object?> json) =>
      _$WAAuthRequestCodeDtoFromJson(json);
}

@freezed
class WAAuthAuthorizeCodeDto with _$WAAuthAuthorizeCodeDto {
  const factory WAAuthAuthorizeCodeDto({
    required String code,
  }) = _WAAuthAuthorizeCodeDto;

  factory WAAuthAuthorizeCodeDto.fromJson(Map<String, Object?> json) =>
      _$WAAuthAuthorizeCodeDtoFromJson(json);
}
