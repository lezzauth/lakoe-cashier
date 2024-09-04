import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.g.dart';
part 'customer.freezed.dart';

@freezed
class FindAllCustomerDto with _$FindAllCustomerDto {
  const factory FindAllCustomerDto({
    required String ownerId,
  }) = _FindAllCustomerDto;
}

extension QueryStringExtension on FindAllCustomerDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {
      "ownerId": ownerId,
    };

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class CreateCustomerDto with _$CreateCustomerDto {
  const factory CreateCustomerDto({
    required String name,
    required String phoneNumber,
    required String outletId,
    String? email,
    String? address,
  }) = _CreateCustomerDto;

  factory CreateCustomerDto.fromJson(Map<String, Object?> json) =>
      _$CreateCustomerDtoFromJson(json);
}
