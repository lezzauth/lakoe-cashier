// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailModelImpl _$$OrderDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailModelImpl(
      id: json['id'] as String,
      price: json['price'] as String,
      status: json['status'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      shipment: OrderDetailShipment.fromJson(
          json['shipment'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderDetailItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      charges: (json['charges'] as List<dynamic>)
          .map((e) => OrderDetailCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderDetailModelImplToJson(
        _$OrderDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'status': instance.status,
      'invoiceNumber': instance.invoiceNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'shipment': instance.shipment,
      'items': instance.items,
      'charges': instance.charges,
    };

_$OrderDetailShipmentImpl _$$OrderDetailShipmentImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailShipmentImpl(
      id: json['id'] as String,
      destinationContactName: json['destinationContactName'] as String,
      destinationContactPhone: json['destinationContactPhone'] as String,
      waybillId: json['waybillId'] as String?,
      trackingId: json['trackingId'] as String?,
      courierType: json['courierType'] as String?,
      courierCompany: json['courierCompany'] as String?,
    );

Map<String, dynamic> _$$OrderDetailShipmentImplToJson(
        _$OrderDetailShipmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'destinationContactName': instance.destinationContactName,
      'destinationContactPhone': instance.destinationContactPhone,
      'waybillId': instance.waybillId,
      'trackingId': instance.trackingId,
      'courierType': instance.courierType,
      'courierCompany': instance.courierCompany,
    };

_$OrderDetailItemImpl _$$OrderDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailItemImpl(
      quantity: (json['quantity'] as num).toInt(),
      price: json['price'] as String,
      product:
          OrderDetailProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderDetailItemImplToJson(
        _$OrderDetailItemImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'price': instance.price,
      'product': instance.product,
    };

_$OrderDetailProductImpl _$$OrderDetailProductImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailProductImpl(
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as String,
    );

Map<String, dynamic> _$$OrderDetailProductImplToJson(
        _$OrderDetailProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
      'price': instance.price,
    };

_$OrderDetailChargeImpl _$$OrderDetailChargeImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailChargeImpl(
      name: json['name'] as String,
      isPercentage: json['isPercentage'] as bool,
      amount: json['amount'] as String,
      percentageValue: (json['percentageValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrderDetailChargeImplToJson(
        _$OrderDetailChargeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isPercentage': instance.isPercentage,
      'amount': instance.amount,
      'percentageValue': instance.percentageValue,
    };
