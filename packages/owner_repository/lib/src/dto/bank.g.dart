// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOwnerBankDtoImpl _$$CreateOwnerBankDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOwnerBankDtoImpl(
      name: json['name'] as String,
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
    );

Map<String, dynamic> _$$CreateOwnerBankDtoImplToJson(
        _$CreateOwnerBankDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
    };

_$UpdateOwnerBankDtoImpl _$$UpdateOwnerBankDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateOwnerBankDtoImpl(
      name: json['name'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      isPrimary: json['isPrimary'] as bool?,
    );

Map<String, dynamic> _$$UpdateOwnerBankDtoImplToJson(
        _$UpdateOwnerBankDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'isPrimary': instance.isPrimary,
    };
