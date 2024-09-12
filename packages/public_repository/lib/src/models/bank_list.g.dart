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

_$GetBankAccountResponseImpl _$$GetBankAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetBankAccountResponseImpl(
      status: json['status'] as bool,
      msg: json['msg'] as String,
      data: BankAccountModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetBankAccountResponseImplToJson(
        _$GetBankAccountResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

_$BankAccountModelImpl _$$BankAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountModelImpl(
      bankCode: json['bankcode'] as String,
      bankName: json['bankname'] as String,
      accountNumber: json['accountnumber'] as String,
      accountName: json['accountname'] as String,
    );

Map<String, dynamic> _$$BankAccountModelImplToJson(
        _$BankAccountModelImpl instance) =>
    <String, dynamic>{
      'bankcode': instance.bankCode,
      'bankname': instance.bankName,
      'accountnumber': instance.accountNumber,
      'accountname': instance.accountName,
    };
