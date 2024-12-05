// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateEmployeeDtoImpl _$$CreateEmployeeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateEmployeeDtoImpl(
      name: json['name'] as String,
      email: json['email'] as String?,
      pin: json['pin'] as String,
      phoneNumber: json['phoneNumber'] as String,
      role: json['role'] as String,
      outletId: json['outletId'] as String?,
    );

Map<String, dynamic> _$$CreateEmployeeDtoImplToJson(
        _$CreateEmployeeDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'pin': instance.pin,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
      'outletId': instance.outletId,
    };

_$UpdateEmployeeDtoImpl _$$UpdateEmployeeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateEmployeeDtoImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      pin: json['pin'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$UpdateEmployeeDtoImplToJson(
        _$UpdateEmployeeDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'pin': instance.pin,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
    };

_$FindAllEmployeeDtoImpl _$$FindAllEmployeeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FindAllEmployeeDtoImpl(
      outletId: json['outletId'] as String?,
    );

Map<String, dynamic> _$$FindAllEmployeeDtoImplToJson(
        _$FindAllEmployeeDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
    };

_$RequestOtpDtoImpl _$$RequestOtpDtoImplFromJson(Map<String, dynamic> json) =>
    _$RequestOtpDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$RequestOtpDtoImplToJson(_$RequestOtpDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

_$VerifyOtpDtoImpl _$$VerifyOtpDtoImplFromJson(Map<String, dynamic> json) =>
    _$VerifyOtpDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$VerifyOtpDtoImplToJson(_$VerifyOtpDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'code': instance.code,
    };

_$UpdatePinDtoImpl _$$UpdatePinDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdatePinDtoImpl(
      pin: json['pin'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$UpdatePinDtoImplToJson(_$UpdatePinDtoImpl instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'token': instance.token,
    };
