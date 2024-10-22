// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenExpiredExceptionImpl _$$TokenExpiredExceptionImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenExpiredExceptionImpl(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$TokenExpiredExceptionImplToJson(
        _$TokenExpiredExceptionImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
