// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableLocationModelImpl _$$TableLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TableLocationModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      outletId: json['outletId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$TableLocationModelImplToJson(
        _$TableLocationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'outletId': instance.outletId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
