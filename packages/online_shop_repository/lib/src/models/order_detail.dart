import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail.g.dart';
part 'order_detail.freezed.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    required String id,
    required String price,
    required String status,
    required String invoiceNumber,
    required DateTime createdAt,
    required OrderDetailShipment shipment,
    required List<OrderDetailItem> items,
    required List<OrderDetailCharge> charges,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
}

@freezed
class OrderDetailShipment with _$OrderDetailShipment {
  const factory OrderDetailShipment({
    required String id,
    required String destinationContactName,
    required String destinationContactPhone,
    String? waybillId,
    String? trackingId,
    String? courierType,
    String? courierCompany,
  }) = _OrderDetailShipment;

  factory OrderDetailShipment.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailShipmentFromJson(json);
}

@freezed
class OrderDetailItem with _$OrderDetailItem {
  const factory OrderDetailItem({
    required int quantity,
    required String price,
    required OrderDetailProduct product,
  }) = _OrderDetailItem;

  factory OrderDetailItem.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailItemFromJson(json);
}

@freezed
class OrderDetailProduct with _$OrderDetailProduct {
  const factory OrderDetailProduct({
    required String name,
    required List<String> images,
  }) = _OrderDetailProduct;

  factory OrderDetailProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailProductFromJson(json);
}

@freezed
class OrderDetailCharge with _$OrderDetailCharge {
  const factory OrderDetailCharge({
    required String name,
    required bool isPercentage,
    required String amount,
    double? percentageValue,
  }) = _OrderDetailCharge;

  factory OrderDetailCharge.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailChargeFromJson(json);
}
