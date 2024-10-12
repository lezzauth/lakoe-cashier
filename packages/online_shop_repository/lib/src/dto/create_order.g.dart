// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderDtoImpl _$$CreateOrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateOrderDtoImpl(
      customerName: json['customer_name'] as String,
      customerPhoneNumber: json['customer_phone_number'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      paymentMethod: json['payment_method'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => CreateOrderProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateOrderDtoImplToJson(
        _$CreateOrderDtoImpl instance) =>
    <String, dynamic>{
      'customer_name': instance.customerName,
      'customer_phone_number': instance.customerPhoneNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'payment_method': instance.paymentMethod,
      'products': instance.products,
    };

_$CreateOrderProductDtoImpl _$$CreateOrderProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderProductDtoImpl(
      id: json['id'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateOrderProductDtoImplToJson(
        _$CreateOrderProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };
