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
      email: json['email'] as String?,
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

_$SaveOrderResponseImpl _$$SaveOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveOrderResponseImpl(
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

_$OrderCashierItemCustomerImpl _$$OrderCashierItemCustomerImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCashierItemCustomerImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$OrderCashierItemCustomerImplToJson(
        _$OrderCashierItemCustomerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$OrderCashierItemTableImpl _$$OrderCashierItemTableImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCashierItemTableImpl(
      no: json['no'] as String,
    );

Map<String, dynamic> _$$OrderCashierItemTableImplToJson(
        _$OrderCashierItemTableImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
    };

_$OrderCashierItemResponseImpl _$$OrderCashierItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCashierItemResponseImpl(
      id: json['id'] as String,
      no: (json['no'] as num).toInt(),
      price: json['price'] as String,
      paymentStatus: json['paymentStatus'] as String,
      customerType: json['customerType'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      customer: json['customer'] == null
          ? null
          : OrderCashierItemCustomer.fromJson(
              json['customer'] as Map<String, dynamic>),
      table: json['table'] == null
          ? null
          : OrderCashierItemTable.fromJson(
              json['table'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderCashierItemResponseImplToJson(
        _$OrderCashierItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'price': instance.price,
      'paymentStatus': instance.paymentStatus,
      'customerType': instance.customerType,
      'type': instance.type,
      'source': instance.source,
      'customer': instance.customer,
      'table': instance.table,
    };

_$RegenerateCashierTokenResponseImpl
    _$$RegenerateCashierTokenResponseImplFromJson(Map<String, dynamic> json) =>
        _$RegenerateCashierTokenResponseImpl(
          token: json['token'] as String,
        );

Map<String, dynamic> _$$RegenerateCashierTokenResponseImplToJson(
        _$RegenerateCashierTokenResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

_$CompleteOrderResponseImpl _$$CompleteOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CompleteOrderResponseImpl(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      transaction:
          Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompleteOrderResponseImplToJson(
        _$CompleteOrderResponseImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'transaction': instance.transaction,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
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
      closedAt: json['closedAt'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
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
      'closedAt': instance.closedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      paymentMethod: json['paymentMethod'] as String,
      status: json['status'] as String,
      paidAmount: json['paidAmount'] as String,
      paidFrom: json['paidFrom'] as String,
      amount: json['amount'] as String,
      change: json['change'] as String,
      accountNumber: json['accountNumber'] as String?,
      photo: json['photo'] as String?,
      orderId: json['orderId'] as String,
      outletId: json['outletId'] as String,
      externalId: json['externalId'] as String?,
      approvalCode: json['approvalCode'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'paidAmount': instance.paidAmount,
      'paidFrom': instance.paidFrom,
      'amount': instance.amount,
      'change': instance.change,
      'accountNumber': instance.accountNumber,
      'photo': instance.photo,
      'orderId': instance.orderId,
      'outletId': instance.outletId,
      'externalId': instance.externalId,
      'approvalCode': instance.approvalCode,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$CancelOrderResponseImpl _$$CancelOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CancelOrderResponseImpl(
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
      closedAt: json['closedAt'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$CancelOrderResponseImplToJson(
        _$CancelOrderResponseImpl instance) =>
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
      'closedAt': instance.closedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
