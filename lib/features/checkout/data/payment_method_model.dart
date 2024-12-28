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
class PaymentMethodCheckout with _$PaymentMethodCheckout {
  const factory PaymentMethodCheckout({
    required String name,
    required String logo,
    @Default(false) bool isSelected,
    @Default([]) List<PaymentMedia> paymentMedia,
  }) = _PaymentMethodCheckout;
}

@freezed
class PaymentCategory with _$PaymentCategory {
  const factory PaymentCategory({
    required String categoryName,
    required List<PaymentMethodCheckout> methods,
  }) = _PaymentCategory;
}
