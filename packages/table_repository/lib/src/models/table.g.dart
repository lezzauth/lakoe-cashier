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
      outletRoom: json['outletRoom'] == null
          ? null
          : OutletRoom.fromJson(json['outletRoom'] as Map<String, dynamic>),
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
      'outletRoom': instance.outletRoom,
    };

_$OutletRoomImpl _$$OutletRoomImplFromJson(Map<String, dynamic> json) =>
    _$OutletRoomImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      outletId: json['outletId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OutletRoomImplToJson(_$OutletRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'outletId': instance.outletId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
