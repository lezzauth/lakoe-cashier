import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class LabelValue<T> with _$LabelValue<T> {
  const factory LabelValue({
    required String label,
    required T value,
  }) = _LabelValue<T>;
}

@freezed
class PaymentMedia with _$PaymentMedia {
  const factory PaymentMedia({
    required String mediaName,
    required String steps,
  }) = _PaymentMedia;
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String name,
    required String logo,
    @Default(false) bool isSelected,
    @Default([]) List<PaymentMedia> paymentMedia,
  }) = _PaymentMethod;
}

@freezed
class PaymentCategory with _$PaymentCategory {
  const factory PaymentCategory({
    required String categoryName,
    required List<PaymentMethod> methods,
  }) = _PaymentCategory;
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
