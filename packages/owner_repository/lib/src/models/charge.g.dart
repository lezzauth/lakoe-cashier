// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChargeModelImpl _$$ChargeModelImplFromJson(Map<String, dynamic> json) =>
    _$ChargeModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      value: json['value'] as String,
      ownerId: json['ownerId'] as String,
      isPercentage: json['isPercentage'] as bool,
    );

Map<String, dynamic> _$$ChargeModelImplToJson(_$ChargeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'ownerId': instance.ownerId,
      'isPercentage': instance.isPercentage,
    };
