import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet.freezed.dart';
part 'outlet.g.dart';

@freezed
class DetailCustomerOutletDto with _$DetailCustomerOutletDto {
  const factory DetailCustomerOutletDto({
    String? from,
    String? to,
  }) = _DetailCustomerOutletDto;

  factory DetailCustomerOutletDto.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOutletDtoFromJson(json);
}

extension QueryStringExtension on DetailCustomerOutletDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}
