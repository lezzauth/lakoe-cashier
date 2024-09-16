// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindAllProductDtoImpl _$$FindAllProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FindAllProductDtoImpl(
      outletId: json['outletId'] as String,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      name: json['name'] as String?,
      availability: json['availability'] as String?,
    );

Map<String, dynamic> _$$FindAllProductDtoImplToJson(
        _$FindAllProductDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'availability': instance.availability,
    };

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
      stock: (json['stock'] as num?)?.toInt(),
      availability: json['availability'] as String?,
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
      'stock': instance.stock,
      'availability': instance.availability,
    };

_$UpdateProductDtoImpl _$$UpdateProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProductDtoImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      modal: (json['modal'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      outletId: json['outletId'] as String?,
      sku: json['sku'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      availability: json['availability'] as String?,
    );

Map<String, dynamic> _$$UpdateProductDtoImplToJson(
        _$UpdateProductDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'modal': instance.modal,
      'categoryId': instance.categoryId,
      'unit': instance.unit,
      'outletId': instance.outletId,
      'sku': instance.sku,
      'stock': instance.stock,
      'availability': instance.availability,
    };
