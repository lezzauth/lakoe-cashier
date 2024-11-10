import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_location.freezed.dart';
part 'table_location.g.dart';

@freezed
class TableLocationModel with _$TableLocationModel {
  const factory TableLocationModel({
    required String id,
    required String name,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _TableLocationModel;

  factory TableLocationModel.fromJson(Map<String, Object?> json) =>
      _$TableLocationModelFromJson(json);
}
