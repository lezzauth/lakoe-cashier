// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProductDtoImpl _$$CreateProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateProductDtoImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toInt(),
      modal: (json['modal'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      unit: json['unit'] as String,
      outletId: json['outletId'] as String,
      sku: json['sku'] as String?,
    );

Map<String, dynamic> _$$CreateProductDtoImplToJson(
        _$CreateProductDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'modal': instance.modal,
      'categoryId': instance.categoryId,
      'unit': instance.unit,
      'outletId': instance.outletId,
      'sku': instance.sku,
    };