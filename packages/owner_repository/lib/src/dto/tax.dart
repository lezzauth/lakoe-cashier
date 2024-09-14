import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax.g.dart';
part 'tax.freezed.dart';

@freezed
class CreateTaxDto with _$CreateTaxDto {
  const factory CreateTaxDto({
    required String name,
    required int value,
  }) = _CreateTaxDto;

  factory CreateTaxDto.fromJson(Map<String, Object?> json) =>
      _$CreateTaxDtoFromJson(json);
}

@freezed
class UpdateTaxDto with _$UpdateTaxDto {
  const factory UpdateTaxDto({
    String? name,
    int? value,
  }) = _UpdateTaxDto;

  factory UpdateTaxDto.fromJson(Map<String, Object?> json) =>
      _$UpdateTaxDtoFromJson(json);
}
