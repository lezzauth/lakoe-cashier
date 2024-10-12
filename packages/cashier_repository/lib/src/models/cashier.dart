import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashier.g.dart';
part 'cashier.freezed.dart';

@freezed
class OpenCashierResponse with _$OpenCashierResponse {
  const factory OpenCashierResponse({
    required String token,
  }) = _OpenCashierResponse;

  factory OpenCashierResponse.fromJson(Map<String, Object?> json) =>
      _$OpenCashierResponseFromJson(json);
}

@freezed
class OperatorModel with _$OperatorModel {
  const factory OperatorModel({
    required String id,
    required String role,
    required String name,
    required String phoneNumber,
    required String email,
    required bool emailVerified,
    required bool phoneVerified,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _OperatorModel;

  factory OperatorModel.fromJson(Map<String, Object?> json) =>
      _$OperatorModelFromJson(json);
}

mixin CashierFields {
  String get id;
  String get status;
  String get initialBalance;
  String get finalBalance;
  String get outletId;
  String get openedAt;
  String? get closedAt;
}

@freezed
class CashierModel with _$CashierModel, CashierFields {
  const factory CashierModel({
    required String id,
    required String status,
    required String initialBalance,
    required String finalBalance,
    required String outletId,
    required String openedAt,
    String? closedAt,
  }) = _CashierModel;

  factory CashierModel.fromJson(Map<String, Object?> json) =>
      _$CashierModelFromJson(json);
}

@freezed
class GetOpenCashierResponse with _$GetOpenCashierResponse, CashierFields {
  const factory GetOpenCashierResponse({
    required String id,
    required String status,
    required String initialBalance,
    required String finalBalance,
    required String outletId,
    required String openedAt,
    String? closedAt,
    required OperatorModel operator,
  }) = _GetOpenCashierResponse;

  factory GetOpenCashierResponse.fromJson(Map<String, Object?> json) =>
      _$GetOpenCashierResponseFromJson(json);
}

@freezed
class SaveOrderResponse with _$SaveOrderResponse {
  const factory SaveOrderResponse({
    required String id,
    required int no,
    required String status,
    required String price,
    String? customerId,
    required String paymentStatus,
    required String customerType,
    required String type,
    required String source,
    required String outletId,
    String? tableId,
  }) = _SaveOrderResponse;

  factory SaveOrderResponse.fromJson(Map<String, Object?> json) =>
      _$SaveOrderResponseFromJson(json);
}

@freezed
class OrderItemCustomer with _$OrderItemCustomer {
  const factory OrderItemCustomer({
    required String name,
  }) = _OrderItemCustomer;

  factory OrderItemCustomer.fromJson(Map<String, Object?> json) =>
      _$OrderItemCustomerFromJson(json);
}

@freezed
class OrderItemTable with _$OrderItemTable {
  const factory OrderItemTable({
    required String no,
  }) = _OrderItemTable;

  factory OrderItemTable.fromJson(Map<String, Object?> json) =>
      _$OrderItemTableFromJson(json);
}

@freezed
class OrderItemResponse with _$OrderItemResponse {
  const factory OrderItemResponse({
    required String id,
    required int no,
    required String price,
    required String paymentStatus,
    required String customerType,
    required String type,
    required String source,
    OrderItemCustomer? customer,
    OrderItemTable? table,
  }) = _OrderItemResponse;

  factory OrderItemResponse.fromJson(Map<String, Object?> json) =>
      _$OrderItemResponseFromJson(json);
}

@freezed
class RegenerateCashierTokenResponse with _$RegenerateCashierTokenResponse {
  const factory RegenerateCashierTokenResponse({
    required String token,
  }) = _RegenerateCashierTokenResponse;

  factory RegenerateCashierTokenResponse.fromJson(Map<String, Object?> json) =>
      _$RegenerateCashierTokenResponseFromJson(json);
}

@freezed
class CompleteOrderResponse with _$CompleteOrderResponse {
  const factory CompleteOrderResponse({
    required String id,
    required int no,
    required String paymentMethod,
    required String status,
    required String paidAmount,
    required String paidFrom,
    required String amount,
    required String change,
    required String? accountNumber,
    required String? photo,
    required String? externalId,
    required String? approvalCode,
    required String orderId,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _CompleteOrderResponse;

  factory CompleteOrderResponse.fromJson(Map<String, Object?> json) =>
      _$CompleteOrderResponseFromJson(json);
}
