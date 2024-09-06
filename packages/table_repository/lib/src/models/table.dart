import 'package:freezed_annotation/freezed_annotation.dart';

part 'table.g.dart';
part 'table.freezed.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required String id,
    required String no,
    required int capacity,
    required String outletId,
    required String outletRoomId,
    required String createdAt,
    required String updatedAt,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, Object?> json) =>
      _$TableModelFromJson(json);
}
