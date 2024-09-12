// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankListModelImpl _$$BankListModelImplFromJson(Map<String, dynamic> json) =>
    _$BankListModelImpl(
      bankCode: json['bank_code'] as String,
      bankName: json['bank_name'] as String,
      swiftCode: json['swift_code'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$BankListModelImplToJson(_$BankListModelImpl instance) =>
    <String, dynamic>{
      'bank_code': instance.bankCode,
      'bank_name': instance.bankName,
      'swift_code': instance.swiftCode,
      'name': instance.name,
      'code': instance.code,
    };
