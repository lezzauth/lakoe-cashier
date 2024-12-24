// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailPakcageDtoImpl _$$DetailPakcageDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailPakcageDtoImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DetailPakcageDtoImplToJson(
        _$DetailPakcageDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$PurchaseDtoImpl _$$PurchaseDtoImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseDtoImpl(
      period: (json['period'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      successReturnUrl: json['successReturnUrl'] as String?,
      failedReturnUrl: json['failedReturnUrl'] as String?,
    );

Map<String, dynamic> _$$PurchaseDtoImplToJson(_$PurchaseDtoImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'paymentMethod': instance.paymentMethod,
      'successReturnUrl': instance.successReturnUrl,
      'failedReturnUrl': instance.failedReturnUrl,
    };
