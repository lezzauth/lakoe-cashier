import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class LabelValue<T> with _$LabelValue {
  const factory LabelValue({
    required String label,
    required T value,
  }) = _LabelValue;
}

class BankVerifyArgument {
  final String bankName;
  final String accountNumber;
  final String accountName;
  final String name;

  BankVerifyArgument({
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    required this.name,
  });
}
