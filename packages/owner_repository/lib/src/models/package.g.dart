// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageActiveImpl _$$PackageActiveImplFromJson(Map<String, dynamic> json) =>
    _$PackageActiveImpl(
      name: json['name'] as String,
      orders: (json['orders'] as num?)?.toInt(),
      products: (json['products'] as num?)?.toInt(),
      employees: (json['employees'] as num?)?.toInt(),
      customers: (json['customers'] as num?)?.toInt(),
      tables: (json['tables'] as num?)?.toInt(),
      hardwareIntegration: (json['hardwareIntegration'] as num?)?.toInt(),
      price: (json['price'] as num).toInt(),
      purchase: json['purchase'] == null
          ? null
          : Purchase.fromJson(json['purchase'] as Map<String, dynamic>),
      endPeriod: json['endPeriod'] as String?,
      activePeriod:
          ActivePeriod.fromJson(json['activePeriod'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PackageActiveImplToJson(_$PackageActiveImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'orders': instance.orders,
      'products': instance.products,
      'employees': instance.employees,
      'customers': instance.customers,
      'tables': instance.tables,
      'hardwareIntegration': instance.hardwareIntegration,
      'price': instance.price,
      'purchase': instance.purchase,
      'endPeriod': instance.endPeriod,
      'activePeriod': instance.activePeriod,
    };

_$PurchaseImpl _$$PurchaseImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseImpl(
      id: json['id'] as String,
      paymentMethod: json['paymentMethod'] as String,
      paidAmount: json['paidAmount'] as String,
      period: (json['period'] as num).toInt(),
      startPeriod: DateTime.parse(json['startPeriod'] as String),
      endPeriod: DateTime.parse(json['endPeriod'] as String),
    );

Map<String, dynamic> _$$PurchaseImplToJson(_$PurchaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'paidAmount': instance.paidAmount,
      'period': instance.period,
      'startPeriod': instance.startPeriod.toIso8601String(),
      'endPeriod': instance.endPeriod.toIso8601String(),
    };

_$ActivePeriodImpl _$$ActivePeriodImplFromJson(Map<String, dynamic> json) =>
    _$ActivePeriodImpl(
      months: (json['months'] as num?)?.toInt(),
      days: (json['days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ActivePeriodImplToJson(_$ActivePeriodImpl instance) =>
    <String, dynamic>{
      'months': instance.months,
      'days': instance.days,
    };
