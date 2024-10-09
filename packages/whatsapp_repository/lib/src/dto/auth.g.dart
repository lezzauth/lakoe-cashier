// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WAAuthRequestCodeDtoImpl _$$WAAuthRequestCodeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WAAuthRequestCodeDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$WAAuthRequestCodeDtoImplToJson(
        _$WAAuthRequestCodeDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

_$WAAuthAuthorizeCodeDtoImpl _$$WAAuthAuthorizeCodeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WAAuthAuthorizeCodeDtoImpl(
      code: json['code'] as String,
    );

Map<String, dynamic> _$$WAAuthAuthorizeCodeDtoImplToJson(
        _$WAAuthAuthorizeCodeDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
