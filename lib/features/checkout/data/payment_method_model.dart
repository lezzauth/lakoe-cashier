import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_model.freezed.dart';

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
