// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnerProfileModelImpl _$$OwnerProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OwnerProfileModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      packageName: json['packageName'] as String,
      email: json['email'] as String?,
      outlets: (json['outlets'] as List<dynamic>)
          .map((e) => Outlet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OwnerProfileModelImplToJson(
        _$OwnerProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'packageName': instance.packageName,
      'email': instance.email,
      'outlets': instance.outlets,
    };

_$OutletImpl _$$OutletImplFromJson(Map<String, dynamic> json) => _$OutletImpl(
      logo: json['logo'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$OutletImplToJson(_$OutletImpl instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'name': instance.name,
      'address': instance.address,
    };

_$UpdateOwnerModelImpl _$$UpdateOwnerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateOwnerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      balance: json['balance'] as String,
      emailVerified: json['emailVerified'] as bool,
      phoneVerified: json['phoneVerified'] as bool,
      packageName: json['packageName'] as String,
      packageExpiretAt: json['packageExpiretAt'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$UpdateOwnerModelImplToJson(
        _$UpdateOwnerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'balance': instance.balance,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'packageName': instance.packageName,
      'packageExpiretAt': instance.packageExpiretAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$RequestOTPResImpl _$$RequestOTPResImplFromJson(Map<String, dynamic> json) =>
    _$RequestOTPResImpl(
      id: json['id'] as String,
      target: json['target'] as String,
      type: json['type'] as String,
      action: json['action'] as String,
      expireAt: json['expireAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$RequestOTPResImplToJson(_$RequestOTPResImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'target': instance.target,
      'type': instance.type,
      'action': instance.action,
      'expireAt': instance.expireAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
