// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindAllCustomerDtoImpl _$$FindAllCustomerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FindAllCustomerDtoImpl(
      ownerId: json['ownerId'] as String,
      search: json['search'] as String?,
    );

Map<String, dynamic> _$$FindAllCustomerDtoImplToJson(
        _$FindAllCustomerDtoImpl instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'search': instance.search,
    };

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
