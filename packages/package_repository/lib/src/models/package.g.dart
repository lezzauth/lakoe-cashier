// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      name: json['name'] as String,
      orders: (json['orders'] as num?)?.toInt(),
      products: (json['products'] as num?)?.toInt(),
      employees: (json['employees'] as num).toInt(),
      customers: (json['customers'] as num?)?.toInt(),
      tables: (json['tables'] as num).toInt(),
      hardwareIntergation: (json['hardwareIntergation'] as num?)?.toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'orders': instance.orders,
      'products': instance.products,
      'employees': instance.employees,
      'customers': instance.customers,
      'tables': instance.tables,
      'hardwareIntergation': instance.hardwareIntergation,
      'price': instance.price,
    };

_$PackagePriceModelImpl _$$PackagePriceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PackagePriceModelImpl(
      name: json['name'] as String,
      discount: (json['discount'] as num).toInt(),
      period: (json['period'] as num).toInt(),
      save: (json['save'] as num).toInt(),
      originPrice: (json['originPrice'] as num).toInt(),
      pricePerMonth: (json['pricePerMonth'] as num).toInt(),
      savePerMonth: (json['savePerMonth'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      startPeriod: DateTime.parse(json['startPeriod'] as String),
      endPeriod: DateTime.parse(json['endPeriod'] as String),
    );

Map<String, dynamic> _$$PackagePriceModelImplToJson(
        _$PackagePriceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'discount': instance.discount,
      'period': instance.period,
      'save': instance.save,
      'originPrice': instance.originPrice,
      'pricePerMonth': instance.pricePerMonth,
      'savePerMonth': instance.savePerMonth,
      'price': instance.price,
      'startPeriod': instance.startPeriod.toIso8601String(),
      'endPeriod': instance.endPeriod.toIso8601String(),
    };
