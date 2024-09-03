// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryCountImpl _$$CategoryCountImplFromJson(Map<String, dynamic> json) =>
    _$CategoryCountImpl(
      products: (json['products'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryCountImplToJson(_$CategoryCountImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String?,
      outletId: json['outletId'] as String,
      count: json['_count'] == null
          ? null
          : CategoryCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'outletId': instance.outletId,
      '_count': instance.count,
    };
