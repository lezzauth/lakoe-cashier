// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindAllTableDtoImpl _$$FindAllTableDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FindAllTableDtoImpl(
      outletId: json['outletId'] as String,
      outletRoomId: json['outletRoomId'] as String?,
    );

Map<String, dynamic> _$$FindAllTableDtoImplToJson(
        _$FindAllTableDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'outletRoomId': instance.outletRoomId,
    };

_$CreateTableDtoImpl _$$CreateTableDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateTableDtoImpl(
      no: json['no'] as String,
      capacity: (json['capacity'] as num).toInt(),
      outletId: json['outletId'] as String,
      outletRoomId: json['outletRoomId'] as String,
    );

Map<String, dynamic> _$$CreateTableDtoImplToJson(
        _$CreateTableDtoImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'capacity': instance.capacity,
      'outletId': instance.outletId,
      'outletRoomId': instance.outletRoomId,
    };

_$UpdateTableDtoImpl _$$UpdateTableDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateTableDtoImpl(
      no: json['no'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      outletId: json['outletId'] as String?,
      outletRoomId: json['outletRoomId'] as String?,
    );

Map<String, dynamic> _$$UpdateTableDtoImplToJson(
        _$UpdateTableDtoImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'capacity': instance.capacity,
      'outletId': instance.outletId,
      'outletRoomId': instance.outletRoomId,
    };
