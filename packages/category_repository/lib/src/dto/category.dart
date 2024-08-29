import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class FindAllCategoryDto with _$FindAllCategoryDto {
  const factory FindAllCategoryDto({
    required String outletId,
  }) = _FindAllCategoryDto;
}

extension QueryStringExtension on FindAllCategoryDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {
      "outletId": outletId,
    };

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}
