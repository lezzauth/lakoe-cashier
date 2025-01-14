// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateNameDtoImpl _$$UpdateNameDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateNameDtoImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UpdateNameDtoImplToJson(_$UpdateNameDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$UpdateEmailDtoImpl _$$UpdateEmailDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateEmailDtoImpl(
      token: json['token'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UpdateEmailDtoImplToJson(
        _$UpdateEmailDtoImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'email': instance.email,
    };

_$UpdatePhoneNumberDtoImpl _$$UpdatePhoneNumberDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePhoneNumberDtoImpl(
      token: json['token'] as String,
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$UpdatePhoneNumberDtoImplToJson(
        _$UpdatePhoneNumberDtoImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };

_$UpdatePinDtoImpl _$$UpdatePinDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdatePinDtoImpl(
      token: json['token'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$$UpdatePinDtoImplToJson(_$UpdatePinDtoImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'pin': instance.pin,
    };

_$RequestOTPDtoImpl _$$RequestOTPDtoImplFromJson(Map<String, dynamic> json) =>
    _$RequestOTPDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$RequestOTPDtoImplToJson(_$RequestOTPDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

_$DeleteAccountDtoImpl _$$DeleteAccountDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteAccountDtoImpl(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
      reasons:
          (json['reasons'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DeleteAccountDtoImplToJson(
        _$DeleteAccountDtoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
      'reasons': instance.reasons,
    };
