// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTaxDtoImpl _$$CreateTaxDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateTaxDtoImpl(
      name: json['name'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateTaxDtoImplToJson(_$CreateTaxDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

_$UpdateTaxDtoImpl _$$UpdateTaxDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateTaxDtoImpl(
      name: json['name'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UpdateTaxDtoImplToJson(_$UpdateTaxDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
