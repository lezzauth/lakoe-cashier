// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveOrderDtoImpl _$$SaveOrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$SaveOrderDtoImpl(
      outletId: json['outletId'] as String,
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerId: json['customerId'] as String?,
      tableId: json['tableId'] as String?,
    );

Map<String, dynamic> _$$SaveOrderDtoImplToJson(_$SaveOrderDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'type': instance.type,
      'items': instance.items,
      'customerId': instance.customerId,
      'tableId': instance.tableId,
    };

_$CompleteCashOrderDtoImpl _$$CompleteCashOrderDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CompleteCashOrderDtoImpl(
      paymentMethod: json['paymentMethod'] as String,
      paidAmount: (json['paidAmount'] as num).toInt(),
      change: (json['change'] as num).toInt(),
      customerId: json['customerId'] as String?,
      redeemCoinAmount: json['redeemCoinAmount'] as String?,
    );

Map<String, dynamic> _$$CompleteCashOrderDtoImplToJson(
        _$CompleteCashOrderDtoImpl instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'paidAmount': instance.paidAmount,
      'change': instance.change,
      'customerId': instance.customerId,
      'redeemCoinAmount': instance.redeemCoinAmount,
    };

_$CompleteBankTransferOrderDataImpl
    _$$CompleteBankTransferOrderDataImplFromJson(Map<String, dynamic> json) =>
        _$CompleteBankTransferOrderDataImpl(
          paymentMethod: json['paymentMethod'] as String,
          paidAmount: (json['paidAmount'] as num).toInt(),
          accountNumber: json['accountNumber'] as String,
        );

Map<String, dynamic> _$$CompleteBankTransferOrderDataImplToJson(
        _$CompleteBankTransferOrderDataImpl instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'paidAmount': instance.paidAmount,
      'accountNumber': instance.accountNumber,
    };

_$OpenCashierDtoImpl _$$OpenCashierDtoImplFromJson(Map<String, dynamic> json) =>
    _$OpenCashierDtoImpl(
      initialBalance: (json['initialBalance'] as num).toInt(),
      outletId: json['outletId'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$$OpenCashierDtoImplToJson(
        _$OpenCashierDtoImpl instance) =>
    <String, dynamic>{
      'initialBalance': instance.initialBalance,
      'outletId': instance.outletId,
      'pin': instance.pin,
    };

_$RegenerateCashierTokenDtoImpl _$$RegenerateCashierTokenDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RegenerateCashierTokenDtoImpl(
      outletId: json['outletId'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$$RegenerateCashierTokenDtoImplToJson(
        _$RegenerateCashierTokenDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'pin': instance.pin,
    };

_$CloseCashierDtoImpl _$$CloseCashierDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CloseCashierDtoImpl(
      finalBalance: (json['finalBalance'] as num).toInt(),
      outletId: json['outletId'] as String,
    );

Map<String, dynamic> _$$CloseCashierDtoImplToJson(
        _$CloseCashierDtoImpl instance) =>
    <String, dynamic>{
      'finalBalance': instance.finalBalance,
      'outletId': instance.outletId,
    };
