// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetBankAccountDtoImpl _$$GetBankAccountDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GetBankAccountDtoImpl(
      bankCode: json['bankCode'] as String,
      accountNumber: json['accountNumber'] as String,
    );

Map<String, dynamic> _$$GetBankAccountDtoImplToJson(
        _$GetBankAccountDtoImpl instance) =>
    <String, dynamic>{
      'bankCode': instance.bankCode,
      'accountNumber': instance.accountNumber,
    };
