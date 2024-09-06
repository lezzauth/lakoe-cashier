// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: json['id'] as String,
      no: json['no'] as String,
      capacity: (json['capacity'] as num).toInt(),
      outletId: json['outletId'] as String,
      outletRoomId: json['outletRoomId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'capacity': instance.capacity,
      'outletId': instance.outletId,
      'outletRoomId': instance.outletRoomId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
