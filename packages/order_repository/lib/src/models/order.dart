import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderItemRes with _$OrderItemRes {
  const factory OrderItemRes({
    required String id,
    required int no,
    required String price,
    required String paymentStatus,
    required String customerType,
    required String type,
    required String source,
    OrderItemCustomer? customer,
    OrderItemTable? table,
  }) = _OrderItemRes;

  factory OrderItemRes.fromJson(Map<String, Object?> json) =>
      _$OrderItemResFromJson(json);
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
class OrderCharge with _$OrderCharge {
  const factory OrderCharge({
    required String id,
    required String orderId,
    required String name,
    required String type,
    required String amount,
    required bool isPercentage,
    int? percentageValue,
    required String createdAt,
    required String updatedAt,
  }) = _OrderCharge;

  factory OrderCharge.fromJson(Map<String, Object?> json) =>
      _$OrderChargeFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    String? notes,
    required String price,
    required int quantity,
    required String orderId,
    required String productId,
    required String createdAt,
    required String updatedAt,
    required OrderItemProduct product,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, Object?> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class Transactions with _$Transactions {
  const factory Transactions({
    required String id,
    required String paymentMethod,
    required String status,
    required String paidAmount,
    required String paidFrom,
    required String amount,
    required String change,
    String? accountNumber,
    String? photo,
    String? externalId,
    String? approvalCode,
    required String orderId,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _Transactions;

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
}

@freezed
class OrderItemProduct with _$OrderItemProduct {
  const factory OrderItemProduct({
    required String name,
    String? description,
    required String price,
    required List<String> images,
  }) = _OrderItemProduct;

  factory OrderItemProduct.fromJson(Map<String, Object?> json) =>
      _$OrderItemProductFromJson(json);
}

@freezed
class OrderCustomer with _$OrderCustomer {
  const factory OrderCustomer({
    required String id,
    required String name,
    String? email,
    required String phoneNumber,
    String? address,
    required String createdAt,
    required String updatedAt,
  }) = _OrderCustomer;

  factory OrderCustomer.fromJson(Map<String, Object?> json) =>
      _$OrderCustomerFromJson(json);
}

@freezed
class OrderTable with _$OrderTable {
  const factory OrderTable({
    required String id,
    required String no,
    required int capacity,
    required String outletId,
    required String outletRoomId,
    required String createdAt,
    required String updatedAt,
  }) = _OrderTable;

  factory OrderTable.fromJson(Map<String, Object?> json) =>
      _$OrderTableFromJson(json);
}

@freezed
class OrderCashier with _$OrderCashier {
  const factory OrderCashier({
    required String id,
    required String status,
    required String initialBalance,
    required String finalBalance,
    required String outletId,
    required String operatorId,
    required String openedAt,
    String? closedAt,
    required OrderOperator operator,
  }) = _OrderCashier;

  factory OrderCashier.fromJson(Map<String, Object?> json) =>
      _$OrderCashierFromJson(json);
}

@freezed
class OrderOperator with _$OrderOperator {
  const factory OrderOperator({
    required String name,
  }) = _OrderOperator;

  factory OrderOperator.fromJson(Map<String, Object?> json) =>
      _$OrderOperatorFromJson(json);
}

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
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
    OrderCustomer? customer,
    List<OrderCharge>? charges,
    List<dynamic>? discount,
    OrderCashier? cashier,
    OrderTable? table,
    List<Transactions>? transactions,
    required List<OrderItem> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}

@freezed
class PreviewOrderItem with _$PreviewOrderItem {
  const factory PreviewOrderItem({
    required String price,
    required int quantity,
    required String productId,
    required String notes,
  }) = _PreviewOrderItem;

  factory PreviewOrderItem.fromJson(Map<String, Object?> json) =>
      _$PreviewOrderItemFromJson(json);
}

@freezed
class PreviewOrderCharge with _$PreviewOrderCharge {
  const factory PreviewOrderCharge({
    required String type,
    required String name,
    required String amount,
    required bool isPercentage,
    String? percentageValue,
  }) = _PreviewOrderCharge;

  factory PreviewOrderCharge.fromJson(Map<String, Object?> json) =>
      _$PreviewOrderChargeFromJson(json);
}

@freezed
class PreviewOrderPriceResponse with _$PreviewOrderPriceResponse {
  const factory PreviewOrderPriceResponse({
    required String total,
    required List<PreviewOrderItem> orderItems,
    required List<PreviewOrderCharge> charges,
    required String orderItemTotal,
  }) = _PreviewOrderPriceResponse;

  factory PreviewOrderPriceResponse.fromJson(Map<String, Object?> json) =>
      _$PreviewOrderPriceResponseFromJson(json);
}

@freezed
class OrderModelWithoutInclude with _$OrderModelWithoutInclude {
  const factory OrderModelWithoutInclude({
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
    required String createdAt,
    required String updatedAt,
  }) = _OrderModelWithoutInclude;

  factory OrderModelWithoutInclude.fromJson(Map<String, Object?> json) =>
      _$OrderModelWithoutIncludeFromJson(json);
}
