import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_all_order.g.dart';
part 'find_all_order.freezed.dart';

@freezed
class FindAllOrderDto with _$FindAllOrderDto {
  const factory FindAllOrderDto({
    String? status,
  }) = _FindAllOrderDto;

  factory FindAllOrderDto.fromJson(Map<String, dynamic> json) =>
      _$FindAllOrderDtoFromJson(json);
}

extension QueryStringExtension on FindAllOrderDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}
