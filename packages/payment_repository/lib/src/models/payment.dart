import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart';
part 'payment.freezed.dart';

@freezed
class PaymentMethodCashier with _$PaymentMethodCashier {
  const factory PaymentMethodCashier({
    required String id,
    required String name,
    required bool isNeedEdc,
    required bool isActive,
    required String description,
    required String channel,
    required String title,
    String? icon,
  }) = _PaymentMethodCashier;

  factory PaymentMethodCashier.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodCashierFromJson(json);
}

@freezed
class SetActiveResponse with _$SetActiveResponse {
  const factory SetActiveResponse({
    required String id,
    required String paymentTypeId,
    required String ownerId,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SetActiveResponse;

  factory SetActiveResponse.fromJson(Map<String, dynamic> json) =>
      _$SetActiveResponseFromJson(json);
}
