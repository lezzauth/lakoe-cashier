// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier.dart';

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

_$SaveOrderDtoImpl _$$SaveOrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$SaveOrderDtoImpl(
      outletId: json['outletId'] as String,
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SaveOrderDtoImplToJson(_$SaveOrderDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'type': instance.type,
      'items': instance.items,
    };

_$CompleteOrderDtoImpl _$$CompleteOrderDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CompleteOrderDtoImpl(
      paymentMethod: json['paymentMethod'] as String,
      paidAmount: (json['paidAmount'] as num).toInt(),
      change: (json['change'] as num).toInt(),
    );

Map<String, dynamic> _$$CompleteOrderDtoImplToJson(
        _$CompleteOrderDtoImpl instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'paidAmount': instance.paidAmount,
      'change': instance.change,
    };

_$OpenCashierDtoImpl _$$OpenCashierDtoImplFromJson(Map<String, dynamic> json) =>
    _$OpenCashierDtoImpl(
      initialBalance: (json['initialBalance'] as num).toInt(),
      outletId: json['outletId'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$$OpenCashierDtoImplToJson(
        _$OpenCashierDtoImpl instance) =>
    <String, dynamic>{
      'initialBalance': instance.initialBalance,
      'outletId': instance.outletId,
      'pin': instance.pin,
    };

_$RegenerateCashierTokenDtoImpl _$$RegenerateCashierTokenDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RegenerateCashierTokenDtoImpl(
      outletId: json['outletId'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$$RegenerateCashierTokenDtoImplToJson(
        _$RegenerateCashierTokenDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'pin': instance.pin,
    };

_$CloseCashierDtoImpl _$$CloseCashierDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CloseCashierDtoImpl(
      finalBalance: (json['finalBalance'] as num).toInt(),
      outletId: json['outletId'] as String,
    );

Map<String, dynamic> _$$CloseCashierDtoImplToJson(
        _$CloseCashierDtoImpl instance) =>
    <String, dynamic>{
      'finalBalance': instance.finalBalance,
      'outletId': instance.outletId,
    };

_$PreviewOrderPriceDtoImpl _$$PreviewOrderPriceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PreviewOrderPriceDtoImpl(
      type: json['type'] as String,
      outletId: json['outletId'] as String,
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
