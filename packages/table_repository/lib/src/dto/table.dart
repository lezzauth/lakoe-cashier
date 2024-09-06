import 'package:freezed_annotation/freezed_annotation.dart';

part 'table.freezed.dart';
part 'table.g.dart';

@freezed
class FindAllTableDto with _$FindAllTableDto {
  const factory FindAllTableDto({
    required String outletId,
    String? outletRoomId,
  }) = _FindAllTableDto;

  factory FindAllTableDto.fromJson(Map<String, Object?> json) =>
      _$FindAllTableDtoFromJson(json);
}

extension QueryStringExtension on FindAllTableDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class CreateTableDto with _$CreateTableDto {
  const factory CreateTableDto({
    required String no,
    required int capacity,
    required String outletId,
    required String outletRoomId,
  }) = _CreateTableDto;

  factory CreateTableDto.fromJson(Map<String, Object?> json) =>
      _$CreateTableDtoFromJson(json);
}

@freezed
class UpdateTableDto with _$UpdateTableDto {
  const factory UpdateTableDto({
    String? no,
    int? capacity,
    String? outletId,
    String? outletRoomId,
  }) = _UpdateTableDto;

  factory UpdateTableDto.fromJson(Map<String, Object?> json) =>
      _$UpdateTableDtoFromJson(json);
}
