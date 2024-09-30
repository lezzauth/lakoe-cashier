import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_location.freezed.dart';
part 'table_location.g.dart';

@freezed
class FindAllTableLocationDto with _$FindAllTableLocationDto {
  const factory FindAllTableLocationDto() = _FindAllTableLocationDto;

  factory FindAllTableLocationDto.fromJson(Map<String, Object?> json) =>
      _$FindAllTableLocationDtoFromJson(json);
}

extension QueryStringExtension on FindAllTableLocationDto {
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
class CreateTableLocationDto with _$CreateTableLocationDto {
  const factory CreateTableLocationDto({
    required String name,
    String? outletId,
  }) = _CreateTableLocationDto;

  factory CreateTableLocationDto.fromJson(Map<String, Object?> json) =>
      _$CreateTableLocationDtoFromJson(json);
}
