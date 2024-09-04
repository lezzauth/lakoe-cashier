import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
class FindAllCategoryDto with _$FindAllCategoryDto {
  const factory FindAllCategoryDto({
    required String outletId,
    String? search,
  }) = _FindAllCategoryDto;

  factory FindAllCategoryDto.fromJson(Map<String, Object?> json) =>
      _$FindAllCategoryDtoFromJson(json);
}

extension QueryStringExtension on FindAllCategoryDto {
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
class CreateCategoryDto with _$CreateCategoryDto {
  const factory CreateCategoryDto({
    required String outletId,
    required String name,
    required String icon,
  }) = _CreateCategoryDto;

  factory CreateCategoryDto.fromJson(Map<String, Object?> json) =>
      _$CreateCategoryDtoFromJson(json);
}

@freezed
class UpdateCategoryDto with _$UpdateCategoryDto {
  const factory UpdateCategoryDto({
    String? name,
    String? icon,
  }) = _UpdateCategoryDto;

  factory UpdateCategoryDto.fromJson(Map<String, Object?> json) =>
      _$UpdateCategoryDtoFromJson(json);
}
