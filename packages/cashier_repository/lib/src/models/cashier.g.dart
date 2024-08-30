// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenCashierResponseImpl _$$OpenCashierResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenCashierResponseImpl(
      token: json['token'] as String,
    );

Map<String, dynamic> _$$OpenCashierResponseImplToJson(
        _$OpenCashierResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

_$OperatorModelImpl _$$OperatorModelImplFromJson(Map<String, dynamic> json) =>
    _$OperatorModelImpl(
      id: json['id'] as String,
      role: json['role'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool,
      phoneVerified: json['phoneVerified'] as bool,
      outletId: json['outletId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OperatorModelImplToJson(_$OperatorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'outletId': instance.outletId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$CashierModelImpl _$$CashierModelImplFromJson(Map<String, dynamic> json) =>
    _$CashierModelImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      initialBalance: json['initialBalance'] as String,
      finalBalance: json['finalBalance'] as String,
      outletId: json['outletId'] as String,
      openedAt: json['openedAt'] as String,
      closedAt: json['closedAt'] as String?,
    );

Map<String, dynamic> _$$CashierModelImplToJson(_$CashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'initialBalance': instance.initialBalance,
      'finalBalance': instance.finalBalance,
      'outletId': instance.outletId,
      'openedAt': instance.openedAt,
      'closedAt': instance.closedAt,
    };

_$GetOpenCashierResponseImpl _$$GetOpenCashierResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOpenCashierResponseImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      initialBalance: json['initialBalance'] as String,
      finalBalance: json['finalBalance'] as String,
      outletId: json['outletId'] as String,
      openedAt: json['openedAt'] as String,
      closedAt: json['closedAt'] as String?,
      operator:
          OperatorModel.fromJson(json['operator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetOpenCashierResponseImplToJson(
        _$GetOpenCashierResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'initialBalance': instance.initialBalance,
      'finalBalance': instance.finalBalance,
      'outletId': instance.outletId,
      'openedAt': instance.openedAt,
      'closedAt': instance.closedAt,
      'operator': instance.operator,
    };

_$PreviewOrderItemImpl _$$PreviewOrderItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PreviewOrderItemImpl(
      price: json['price'] as String,
      quantity: (json['quantity'] as num).toInt(),
      productId: json['productId'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$PreviewOrderItemImplToJson(
        _$PreviewOrderItemImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'notes': instance.notes,
    };

_$PreviewOrderChargeImpl _$$PreviewOrderChargeImplFromJson(
        Map<String, dynamic> json) =>
    _$PreviewOrderChargeImpl(
      type: json['type'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$PreviewOrderChargeImplToJson(
        _$PreviewOrderChargeImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };

_$PreviewOrderPriceResponseImpl _$$PreviewOrderPriceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PreviewOrderPriceResponseImpl(
      total: json['total'] as String,
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => PreviewOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      charges: (json['charges'] as List<dynamic>)
          .map((e) => PreviewOrderCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PreviewOrderPriceResponseImplToJson(
        _$PreviewOrderPriceResponseImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'orderItems': instance.orderItems,
      'charges': instance.charges,
    };

_$SaveOrderResponseImpl _$$SaveOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveOrderResponseImpl(
      id: json['id'] as String,
      no: json['no'] as String,
      status: json['status'] as String,
      price: json['price'] as String,
      customerId: json['customerId'] as String?,
      paymentStatus: json['paymentStatus'] as String,
      customerType: json['customerType'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      outletId: json['outletId'] as String,
      tableId: json['tableId'] as String?,
    );

Map<String, dynamic> _$$SaveOrderResponseImplToJson(
        _$SaveOrderResponseImpl instance) =>
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
    };
