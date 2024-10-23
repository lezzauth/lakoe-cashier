// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DioExceptionModelImpl _$$DioExceptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DioExceptionModelImpl(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$DioExceptionModelImplToJson(
        _$DioExceptionModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
