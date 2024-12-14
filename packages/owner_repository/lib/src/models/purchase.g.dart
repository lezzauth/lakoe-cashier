// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryPurchaseModelImpl _$$HistoryPurchaseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryPurchaseModelImpl(
      id: json['id'] as String,
      paymentMethod: json['paymentMethod'] as String,
      status: json['status'] as String,
      paidAmount: json['paidAmount'] as String,
      amount: json['amount'] as String,
      period: (json['period'] as num).toInt(),
      startPeriod: json['startPeriod'] as String,
      endPeriod: json['endPeriod'] as String,
      ownerId: json['ownerId'] as String,
      externalId: json['externalId'] as String?,
      packageName: json['packageName'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$HistoryPurchaseModelImplToJson(
        _$HistoryPurchaseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'paidAmount': instance.paidAmount,
      'amount': instance.amount,
      'period': instance.period,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'ownerId': instance.ownerId,
      'externalId': instance.externalId,
      'packageName': instance.packageName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
