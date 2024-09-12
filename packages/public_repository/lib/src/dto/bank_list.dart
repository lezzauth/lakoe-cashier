import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_list.g.dart';
part 'bank_list.freezed.dart';

@freezed
class GetBankAccountDto with _$GetBankAccountDto {
  const factory GetBankAccountDto({
    required String bankCode,
    required String accountNumber,
  }) = _GetBankAccountDto;

  factory GetBankAccountDto.fromJson(Map<String, Object?> json) =>
      _$GetBankAccountDtoFromJson(json);
}

extension QueryStringExtension on GetBankAccountDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}
