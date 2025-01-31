// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeModelImpl _$$EmployeeModelImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeModelImpl(
      id: json['id'] as String,
      role: json['role'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
      emailVerified: json['emailVerified'] as bool,
      phoneVerified: json['phoneVerified'] as bool,
      outletId: json['outletId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$EmployeeModelImplToJson(_$EmployeeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'outletId': instance.outletId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$RequestOtpResImpl _$$RequestOtpResImplFromJson(Map<String, dynamic> json) =>
    _$RequestOtpResImpl(
      id: json['id'] as String,
      target: json['target'] as String,
      type: json['type'] as String,
      action: json['action'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$RequestOtpResImplToJson(_$RequestOtpResImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'target': instance.target,
      'type': instance.type,
      'action': instance.action,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$VerifyOtpResImpl _$$VerifyOtpResImplFromJson(Map<String, dynamic> json) =>
    _$VerifyOtpResImpl(
      token: json['token'] as String,
    );

Map<String, dynamic> _$$VerifyOtpResImplToJson(_$VerifyOtpResImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
