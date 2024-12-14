import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.g.dart';
part 'customer.freezed.dart';

@freezed
class FindAllCustomerDto with _$FindAllCustomerDto {
  const factory FindAllCustomerDto({
    String? ownerId,
    String? search,
  }) = _FindAllCustomerDto;

  factory FindAllCustomerDto.fromJson(Map<String, Object?> json) =>
      _$FindAllCustomerDtoFromJson(json);
}

extension QueryStringExtension on FindAllCustomerDto {
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
class CustomerDto with _$CustomerDto {
  const factory CustomerDto({
    required String name,
    required String phoneNumber,
    String? outletId,
    String? email,
    String? address,
  }) = _CustomerDto;

  factory CustomerDto.fromJson(Map<String, Object?> json) =>
      _$CustomerDtoFromJson(json);
}
