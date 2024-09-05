// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderChargeImpl _$$OrderChargeImplFromJson(Map<String, dynamic> json) =>
    _$OrderChargeImpl(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      type: json['type'] as String,
      amount: json['amount'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OrderChargeImplToJson(_$OrderChargeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'type': instance.type,
      'amount': instance.amount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as String,
      notes: json['notes'] as String?,
      price: json['price'] as String,
      quantity: (json['quantity'] as num).toInt(),
      orderId: json['orderId'] as String,
      productId: json['productId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      product:
          OrderItemProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notes': instance.notes,
      'price': instance.price,
      'quantity': instance.quantity,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'product': instance.product,
    };

_$OrderItemProductImpl _$$OrderItemProductImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemProductImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      price: json['price'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$OrderItemProductImplToJson(
        _$OrderItemProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
    };

_$OrderCustomerImpl _$$OrderCustomerImplFromJson(Map<String, dynamic> json) =>
    _$OrderCustomerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OrderCustomerImplToJson(_$OrderCustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$OrderTableImpl _$$OrderTableImplFromJson(Map<String, dynamic> json) =>
    _$OrderTableImpl();

Map<String, dynamic> _$$OrderTableImplToJson(_$OrderTableImpl instance) =>
    <String, dynamic>{};

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      no: (json['no'] as num).toInt(),
      status: json['status'] as String,
      price: json['price'] as String,
      customerId: json['customerId'] as String?,
      paymentStatus: json['paymentStatus'] as String,
      customerType: json['customerType'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      outletId: json['outletId'] as String,
      tableId: json['tableId'] as String?,
      cashierId: json['cashierId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      customer: json['customer'] == null
          ? null
          : OrderCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      charges: (json['charges'] as List<dynamic>)
          .map((e) => OrderCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      table: json['table'] == null
          ? null
          : OrderTable.fromJson(json['table'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'status': instance.status,
      'price': instance.price,
      'customerId': instance.customerId,
      'paymentStatus': instance.paymentStatus,
      'customerType': instance.customerType,
      'type': instance.type,
      'source': instance.source,
      'outletId': instance.outletId,
      'tableId': instance.tableId,
      'cashierId': instance.cashierId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'customer': instance.customer,
      'charges': instance.charges,
      'table': instance.table,
      'items': instance.items,
    };
