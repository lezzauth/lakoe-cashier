// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCustomerDtoImpl _$$CreateCustomerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCustomerDtoImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      outletId: json['outletId'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$CreateCustomerDtoImplToJson(
        _$CreateCustomerDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'outletId': instance.outletId,
      'email': instance.email,
      'address': instance.address,
    };
