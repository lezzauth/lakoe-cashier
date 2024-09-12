// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnerBankModelImpl _$$OwnerBankModelImplFromJson(Map<String, dynamic> json) =>
    _$OwnerBankModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isPrimary: json['isPrimary'] as bool,
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      ownerId: json['ownerId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OwnerBankModelImplToJson(
        _$OwnerBankModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isPrimary': instance.isPrimary,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
