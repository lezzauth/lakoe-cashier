import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
class CreateOwnerBankDto with _$CreateOwnerBankDto {
  const factory CreateOwnerBankDto({
    required String name,
    required String accountNumber,
    required String accountName,
  }) = _CreateOwnerBankDto;

  factory CreateOwnerBankDto.fromJson(Map<String, Object?> json) =>
      _$CreateOwnerBankDtoFromJson(json);
}

@freezed
class UpdateOwnerBankDto with _$UpdateOwnerBankDto {
  const factory UpdateOwnerBankDto({
    String? name,
    String? accountNumber,
    String? accountName,
    bool? isPrimary,
  }) = _UpdateOwnerBankDto;

  factory UpdateOwnerBankDto.fromJson(Map<String, Object?> json) =>
      _$UpdateOwnerBankDtoFromJson(json);
}
