// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateChargeDtoImpl _$$CreateChargeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChargeDtoImpl(
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      isPrecentage: json['isPrecentage'] as bool,
    );

Map<String, dynamic> _$$CreateChargeDtoImplToJson(
        _$CreateChargeDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'isPrecentage': instance.isPrecentage,
    };

_$UpdateChargeDtoImpl _$$UpdateChargeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateChargeDtoImpl(
      name: json['name'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      isPrecentage: json['isPrecentage'] as bool?,
    );

Map<String, dynamic> _$$UpdateChargeDtoImplToJson(
        _$UpdateChargeDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'isPrecentage': instance.isPrecentage,
    };
