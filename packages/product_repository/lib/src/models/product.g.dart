// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String?,
      price: json['price'] as String,
      modal: json['modal'] as String,
      description: json['description'] as String?,
      unit: json['unit'] as String?,
      categoryId: (json['categoryId'] as num).toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      outletId: json['outletId'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'modal': instance.modal,
      'description': instance.description,
      'unit': instance.unit,
      'categoryId': instance.categoryId,
      'stock': instance.stock,
      'images': instance.images,
      'outletId': instance.outletId,
    };
