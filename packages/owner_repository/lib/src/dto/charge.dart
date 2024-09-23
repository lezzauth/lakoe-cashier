import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge.g.dart';
part 'charge.freezed.dart';

@freezed
class CreateChargeDto with _$CreateChargeDto {
  const factory CreateChargeDto({
    required String name,
    required double value,
    required bool isPrecentage,
  }) = _CreateChargeDto;

  factory CreateChargeDto.fromJson(Map<String, Object?> json) =>
      _$CreateChargeDtoFromJson(json);
}

@freezed
class UpdateChargeDto with _$UpdateChargeDto {
  const factory UpdateChargeDto({
    String? name,
    double? value,
    bool? isPrecentage,
  }) = _UpdateChargeDto;

  factory UpdateChargeDto.fromJson(Map<String, Object?> json) =>
      _$UpdateChargeDtoFromJson(json);
}
