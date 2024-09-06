// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindAllTableLocationDtoImpl _$$FindAllTableLocationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FindAllTableLocationDtoImpl(
      outletId: json['outletId'] as String,
    );

Map<String, dynamic> _$$FindAllTableLocationDtoImplToJson(
        _$FindAllTableLocationDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
    };

_$CreateTableLocationDtoImpl _$$CreateTableLocationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTableLocationDtoImpl(
      name: json['name'] as String,
      outletId: json['outletId'] as String,
    );

Map<String, dynamic> _$$CreateTableLocationDtoImplToJson(
        _$CreateTableLocationDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'outletId': instance.outletId,
    };
