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
    String? email,
    String? profilePicture,
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
class OrderCashierItemCustomer with _$OrderCashierItemCustomer {
  const factory OrderCashierItemCustomer({
    required String name,
  }) = _OrderCashierItemCustomer;

  factory OrderCashierItemCustomer.fromJson(Map<String, Object?> json) =>
      _$OrderCashierItemCustomerFromJson(json);
}

@freezed
class OrderCashierItemTable with _$OrderCashierItemTable {
  const factory OrderCashierItemTable({
    required String no,
  }) = _OrderCashierItemTable;

  factory OrderCashierItemTable.fromJson(Map<String, Object?> json) =>
      _$OrderCashierItemTableFromJson(json);
}

@freezed
class OrderCashierItemRes with _$OrderCashierItemRes {
  const factory OrderCashierItemRes({
    required String id,
    required int no,
    required String price,
    required String paymentStatus,
    required String customerType,
    required String type,
    required String source,
    required String status,
    OrderCashierItemCustomer? customer,
    OrderCashierItemTable? table,
  }) = _OrderCashierItemRes;

  factory OrderCashierItemRes.fromJson(Map<String, Object?> json) =>
      _$OrderCashierItemResFromJson(json);
}

@freezed
class RegenerateCashierTokenRes with _$RegenerateCashierTokenRes {
  const factory RegenerateCashierTokenRes({
    required String token,
  }) = _RegenerateCashierTokenRes;

  factory RegenerateCashierTokenRes.fromJson(Map<String, Object?> json) =>
      _$RegenerateCashierTokenResFromJson(json);
}

@freezed
class CompleteOrderRes with _$CompleteOrderRes {
  const factory CompleteOrderRes({
    required Order order,
    required Transaction transaction,
  }) = _CompleteOrderRes;

  factory CompleteOrderRes.fromJson(Map<String, Object?> json) =>
      _$CompleteOrderResFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
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
    required String cashierId,
    required String closedAt,
    required String createdAt,
    required String updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String paymentMethod,
    required String status,
    required String paidAmount,
    required String paidFrom,
    required String amount,
    required String change,
    String? accountNumber,
    String? photo,
    required String orderId,
    required String outletId,
    String? externalId,
    String? approvalCode,
    required String createdAt,
    required String updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json) =>
      _$TransactionFromJson(json);
}

@freezed
class CancelOrderResponse with _$CancelOrderResponse {
  const factory CancelOrderResponse({
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
    required String cashierId,
    String? closedAt,
    required String createdAt,
    required String updatedAt,
  }) = _CancelOrderResponse;

  factory CancelOrderResponse.fromJson(Map<String, Object?> json) =>
      _$CancelOrderResponseFromJson(json);
}
