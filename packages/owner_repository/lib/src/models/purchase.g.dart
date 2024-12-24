// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseDetailImpl _$$PurchaseDetailImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseDetailImpl(
      purchase:
          PurchaseModel.fromJson(json['purchase'] as Map<String, dynamic>),
      paymentRequest: PaymentRequest.fromJson(
          json['paymentRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseDetailImplToJson(
        _$PurchaseDetailImpl instance) =>
    <String, dynamic>{
      'purchase': instance.purchase,
      'paymentRequest': instance.paymentRequest,
    };

_$PurchaseModelImpl _$$PurchaseModelImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseModelImpl(
      id: json['id'] as String,
      paymentMethod: json['paymentMethod'] as String,
      status: json['status'] as String,
      paidAmount: json['paidAmount'] as String,
      amount: json['amount'] as String,
      period: (json['period'] as num).toInt(),
      startPeriod: json['startPeriod'] as String,
      endPeriod: json['endPeriod'] as String,
      ownerId: json['ownerId'] as String,
      externalId: json['externalId'] as String?,
      packageName: json['packageName'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      paymentRequest: json['paymentRequest'] == null
          ? null
          : PaymentRequest.fromJson(
              json['paymentRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseModelImplToJson(_$PurchaseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'paidAmount': instance.paidAmount,
      'amount': instance.amount,
      'period': instance.period,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'ownerId': instance.ownerId,
      'externalId': instance.externalId,
      'packageName': instance.packageName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'paymentRequest': instance.paymentRequest,
    };

_$PaymentRequestImpl _$$PaymentRequestImplFromJson(Map<String, dynamic> json) =>
    _$PaymentRequestImpl(
      id: json['id'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      referenceId: json['referenceId'] as String,
      businessId: json['businessId'] as String,
      amount: (json['amount'] as num).toInt(),
      country: json['country'] as String,
      currency: json['currency'] as String,
      paymentMethod:
          PaymentMethod.fromJson(json['paymentMethod'] as Map<String, dynamic>),
      captureMethod: json['captureMethod'] as String,
      status: json['status'] as String,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentRequestImplToJson(
        _$PaymentRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'referenceId': instance.referenceId,
      'businessId': instance.businessId,
      'amount': instance.amount,
      'country': instance.country,
      'currency': instance.currency,
      'paymentMethod': instance.paymentMethod,
      'captureMethod': instance.captureMethod,
      'status': instance.status,
      'actions': instance.actions,
      'items': instance.items,
    };

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      referenceId: json['referenceId'] as String,
      ewallet: json['ewallet'] == null
          ? null
          : Ewallet.fromJson(json['ewallet'] as Map<String, dynamic>),
      virtualAccount: json['virtualAccount'] == null
          ? null
          : VirtualAccount.fromJson(
              json['virtualAccount'] as Map<String, dynamic>),
      reusability: json['reusability'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'created': instance.created,
      'updated': instance.updated,
      'referenceId': instance.referenceId,
      'ewallet': instance.ewallet,
      'virtualAccount': instance.virtualAccount,
      'reusability': instance.reusability,
      'status': instance.status,
    };

_$EwalletImpl _$$EwalletImplFromJson(Map<String, dynamic> json) =>
    _$EwalletImpl(
      channelCode: json['channelCode'] as String,
      channelProperties: ChannelProperties.fromJson(
          json['channelProperties'] as Map<String, dynamic>),
      account: json['account'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EwalletImplToJson(_$EwalletImpl instance) =>
    <String, dynamic>{
      'channelCode': instance.channelCode,
      'channelProperties': instance.channelProperties,
      'account': instance.account,
    };

_$VirtualAccountImpl _$$VirtualAccountImplFromJson(Map<String, dynamic> json) =>
    _$VirtualAccountImpl(
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      channelCode: json['channelCode'] as String,
      channelProperties: VirtualAccountChannelProperties.fromJson(
          json['channelProperties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VirtualAccountImplToJson(
        _$VirtualAccountImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'channelCode': instance.channelCode,
      'channelProperties': instance.channelProperties,
    };

_$ChannelPropertiesImpl _$$ChannelPropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelPropertiesImpl(
      successReturnUrl: json['successReturnUrl'] as String,
      failureReturnUrl: json['failureReturnUrl'] as String,
    );

Map<String, dynamic> _$$ChannelPropertiesImplToJson(
        _$ChannelPropertiesImpl instance) =>
    <String, dynamic>{
      'successReturnUrl': instance.successReturnUrl,
      'failureReturnUrl': instance.failureReturnUrl,
    };

_$VirtualAccountChannelPropertiesImpl
    _$$VirtualAccountChannelPropertiesImplFromJson(Map<String, dynamic> json) =>
        _$VirtualAccountChannelPropertiesImpl(
          customerName: json['customerName'] as String,
          virtualAccountNumber: json['virtualAccountNumber'] as String,
          expiresAt: json['expiresAt'] as String,
        );

Map<String, dynamic> _$$VirtualAccountChannelPropertiesImplToJson(
        _$VirtualAccountChannelPropertiesImpl instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'virtualAccountNumber': instance.virtualAccountNumber,
      'expiresAt': instance.expiresAt,
    };

_$ActionImpl _$$ActionImplFromJson(Map<String, dynamic> json) => _$ActionImpl(
      action: json['action'] as String,
      urlType: json['urlType'] as String,
      method: json['method'] as String,
      url: json['url'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$$ActionImplToJson(_$ActionImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'urlType': instance.urlType,
      'method': instance.method,
      'url': instance.url,
      'qrCode': instance.qrCode,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      referenceId: json['referenceId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
      currency: json['currency'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'referenceId': instance.referenceId,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'currency': instance.currency,
      'quantity': instance.quantity,
      'price': instance.price,
    };
