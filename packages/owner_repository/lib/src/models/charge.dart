import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge.g.dart';
part 'charge.freezed.dart';

@freezed
class ChargeModel with _$ChargeModel {
  const factory ChargeModel({
    required String id,
    required String name,
    required String value,
    required String ownerId,
    required bool isPercentage,
  }) = _ChargeModel;

  factory ChargeModel.fromJson(Map<String, Object?> json) =>
      _$ChargeModelFromJson(json);
}
