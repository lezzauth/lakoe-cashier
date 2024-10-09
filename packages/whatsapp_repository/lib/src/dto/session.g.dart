// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWASessionDtoImpl _$$CreateWASessionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWASessionDtoImpl(
      name: json['name'] as String?,
      start: json['start'] as bool?,
      config: WASessionConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateWASessionDtoImplToJson(
        _$CreateWASessionDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start': instance.start,
      'config': instance.config,
    };
