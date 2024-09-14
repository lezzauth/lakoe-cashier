import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax.g.dart';
part 'tax.freezed.dart';

@freezed
class TaxModel with _$TaxModel {
  const factory TaxModel({
    required String id,
    required String name,
    required int value,
    required String ownerId,
  }) = _TaxModel;

  factory TaxModel.fromJson(Map<String, Object?> json) =>
      _$TaxModelFromJson(json);
}
