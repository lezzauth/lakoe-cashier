// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemDtoImpl _$$OrderItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemDtoImpl(
      notes: json['notes'] as String? ?? "",
      quantity: (json['quantity'] as num).toInt(),
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$OrderItemDtoImplToJson(_$OrderItemDtoImpl instance) =>
    <String, dynamic>{
      'notes': instance.notes,
      'quantity': instance.quantity,
      'productId': instance.productId,
    };

_$PreviewOrderPriceDtoImpl _$$PreviewOrderPriceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PreviewOrderPriceDtoImpl(
      type: json['type'] as String,
      outletId: json['outletId'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PreviewOrderPriceDtoImplToJson(
        _$PreviewOrderPriceDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'outletId': instance.outletId,
      'items': instance.items,
    };
