// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DioExceptionModelImpl _$$DioExceptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DioExceptionModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      error: json['error'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$DioExceptionModelImplToJson(
        _$DioExceptionModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'message': instance.message,
    };
