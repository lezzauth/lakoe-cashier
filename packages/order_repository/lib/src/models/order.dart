import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderCharge with _$OrderCharge {
  const factory OrderCharge({
    required String id,
    required String orderId,
    required String type,
    required String amount,
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
  const factory OrderTable() = _OrderTable;

  factory OrderTable.fromJson(Map<String, Object?> json) =>
      _$OrderTableFromJson(json);
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
    required String createdAt,
    required String updatedAt,
    OrderCustomer? customer,
    required List<OrderCharge> charges,
    OrderTable? table,
    required List<OrderItem> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}