// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isNeedEdc: json['isNeedEdc'] as bool,
      isActive: json['isActive'] as bool,
      description: json['description'] as String,
      channel: json['channel'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isNeedEdc': instance.isNeedEdc,
      'isActive': instance.isActive,
      'description': instance.description,
      'channel': instance.channel,
      'title': instance.title,
      'icon': instance.icon,
    };

_$SetActiveResponseImpl _$$SetActiveResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SetActiveResponseImpl(
      id: json['id'] as String,
      paymentTypeId: json['paymentTypeId'] as String,
      ownerId: json['ownerId'] as String,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SetActiveResponseImplToJson(
        _$SetActiveResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentTypeId': instance.paymentTypeId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
