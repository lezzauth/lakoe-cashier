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
      availability: json['availability'] as String,
      profit: json['profit'] as String,
      favoriteCustomerId: json['favoriteCustomerId'] as String?,
      sold: (json['sold'] as num).toInt(),
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
      'availability': instance.availability,
      'profit': instance.profit,
      'favoriteCustomerId': instance.favoriteCustomerId,
      'sold': instance.sold,
    };

_$ProductOrderModelImpl _$$ProductOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductOrderModelImpl(
      orderId: json['orderId'] as String,
      customerName: json['customerName'] as String,
      createdAt: json['createdAt'] as String,
      paymentMethod: json['paymentMethod'] as String?,
      itemTotal: (json['itemTotal'] as num).toInt(),
      price: json['price'] as String,
    );

Map<String, dynamic> _$$ProductOrderModelImplToJson(
        _$ProductOrderModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerName': instance.customerName,
      'createdAt': instance.createdAt,
      'paymentMethod': instance.paymentMethod,
      'itemTotal': instance.itemTotal,
      'price': instance.price,
    };

_$ListOrderByProductResponseImpl _$$ListOrderByProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListOrderByProductResponseImpl(
      nextCursor: json['nextCursor'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListOrderByProductResponseImplToJson(
        _$ListOrderByProductResponseImpl instance) =>
    <String, dynamic>{
      'nextCursor': instance.nextCursor,
      'data': instance.data,
    };
