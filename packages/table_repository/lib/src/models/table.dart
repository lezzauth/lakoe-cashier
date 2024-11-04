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
    OutletRoom? outletRoom,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, Object?> json) =>
      _$TableModelFromJson(json);
}

@freezed
class OutletRoom with _$OutletRoom {
  const factory OutletRoom({
    required String id,
    required String name,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _OutletRoom;

  factory OutletRoom.fromJson(Map<String, Object?> json) =>
      _$OutletRoomFromJson(json);
}
