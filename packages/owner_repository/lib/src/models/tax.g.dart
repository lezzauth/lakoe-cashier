// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxModelImpl _$$TaxModelImplFromJson(Map<String, dynamic> json) =>
    _$TaxModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      value: (json['value'] as num).toInt(),
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$$TaxModelImplToJson(_$TaxModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'ownerId': instance.ownerId,
    };
