// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutletDtoImpl _$$OutletDtoImplFromJson(Map<String, dynamic> json) =>
    _$OutletDtoImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$OutletDtoImplToJson(_$OutletDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$RegisterDtoImpl _$$RegisterDtoImplFromJson(Map<String, dynamic> json) =>
    _$RegisterDtoImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pin: json['pin'] as String,
      outlet: OutletDto.fromJson(json['outlet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegisterDtoImplToJson(_$RegisterDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'outlet': instance.outlet,
    };

_$RequestOTPDtoImpl _$$RequestOTPDtoImplFromJson(Map<String, dynamic> json) =>
    _$RequestOTPDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$RequestOTPDtoImplToJson(_$RequestOTPDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

_$VerifyOTPDtoImpl _$$VerifyOTPDtoImplFromJson(Map<String, dynamic> json) =>
    _$VerifyOTPDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$VerifyOTPDtoImplToJson(_$VerifyOTPDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'code': instance.code,
    };
