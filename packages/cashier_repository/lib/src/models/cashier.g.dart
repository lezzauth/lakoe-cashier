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
