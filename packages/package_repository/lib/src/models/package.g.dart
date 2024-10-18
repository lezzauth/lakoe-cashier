// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      name: json['name'] as String,
      orders: (json['orders'] as num?)?.toInt(),
      products: (json['products'] as num?)?.toInt(),
      employees: (json['employees'] as num).toInt(),
      customers: (json['customers'] as num?)?.toInt(),
      tables: (json['tables'] as num).toInt(),
      hardwareIntergation: (json['hardwareIntergation'] as num?)?.toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'orders': instance.orders,
      'products': instance.products,
      'employees': instance.employees,
      'customers': instance.customers,
      'tables': instance.tables,
      'hardwareIntergation': instance.hardwareIntergation,
      'price': instance.price,
    };

_$PackagePriceModelImpl _$$PackagePriceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PackagePriceModelImpl(
      name: json['name'] as String,
      discount: (json['discount'] as num).toInt(),
      period: (json['period'] as num).toInt(),
      save: (json['save'] as num).toInt(),
      originPrice: (json['originPrice'] as num).toInt(),
      pricePerMonth: (json['pricePerMonth'] as num).toInt(),
      savePerMonth: (json['savePerMonth'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      startPeriod: DateTime.parse(json['startPeriod'] as String),
      endPeriod: DateTime.parse(json['endPeriod'] as String),
    );

Map<String, dynamic> _$$PackagePriceModelImplToJson(
        _$PackagePriceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'discount': instance.discount,
      'period': instance.period,
      'save': instance.save,
      'originPrice': instance.originPrice,
      'pricePerMonth': instance.pricePerMonth,
      'savePerMonth': instance.savePerMonth,
      'price': instance.price,
      'startPeriod': instance.startPeriod.toIso8601String(),
      'endPeriod': instance.endPeriod.toIso8601String(),
    };

_$PurchaseResponseModelImpl _$$PurchaseResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseResponseModelImpl(
      purchase:
          PurchaseModel.fromJson(json['purchase'] as Map<String, dynamic>),
      paymentRequest: PaymentRequestModel.fromJson(
          json['paymentRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseResponseModelImplToJson(
        _$PurchaseResponseModelImpl instance) =>
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
      startPeriod: DateTime.parse(json['startPeriod'] as String),
      endPeriod: DateTime.parse(json['endPeriod'] as String),
      ownerId: json['ownerId'] as String,
      externalId: json['externalId'] as String?,
      packageName: json['packageName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PurchaseModelImplToJson(_$PurchaseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'paidAmount': instance.paidAmount,
      'amount': instance.amount,
      'period': instance.period,
      'startPeriod': instance.startPeriod.toIso8601String(),
      'endPeriod': instance.endPeriod.toIso8601String(),
      'ownerId': instance.ownerId,
      'externalId': instance.externalId,
      'packageName': instance.packageName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$PaymentRequestModelImpl _$$PaymentRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentRequestModelImpl(
      id: json['id'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      referenceId: json['referenceId'] as String,
      businessId: json['businessId'] as String,
      amount: (json['amount'] as num).toInt(),
      country: json['country'] as String,
      currency: json['currency'] as String,
      paymentMethod: PaymentMethodModel.fromJson(
          json['paymentMethod'] as Map<String, dynamic>),
      captureMethod: json['captureMethod'] as String,
      status: json['status'] as String,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => PaymentActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentRequestModelImplToJson(
        _$PaymentRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'referenceId': instance.referenceId,
      'businessId': instance.businessId,
      'amount': instance.amount,
      'country': instance.country,
      'currency': instance.currency,
      'paymentMethod': instance.paymentMethod,
      'captureMethod': instance.captureMethod,
      'status': instance.status,
      'actions': instance.actions,
    };

_$PaymentMethodModelImpl _$$PaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodModelImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      referenceId: json['referenceId'] as String,
      ewallet: json['ewallet'] == null
          ? null
          : EWalletModel.fromJson(json['ewallet'] as Map<String, dynamic>),
      virtualAccount: json['virtualAccount'] == null
          ? null
          : VirtualAccountModel.fromJson(
              json['virtualAccount'] as Map<String, dynamic>),
      reusability: json['reusability'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PaymentMethodModelImplToJson(
        _$PaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'referenceId': instance.referenceId,
      'ewallet': instance.ewallet,
      'virtualAccount': instance.virtualAccount,
      'reusability': instance.reusability,
      'status': instance.status,
    };

_$EWalletModelImpl _$$EWalletModelImplFromJson(Map<String, dynamic> json) =>
    _$EWalletModelImpl(
      channelCode: json['channelCode'] as String,
      channelProperties: ChannelPropertiesModel.fromJson(
          json['channelProperties'] as Map<String, dynamic>),
      account: json['account'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EWalletModelImplToJson(_$EWalletModelImpl instance) =>
    <String, dynamic>{
      'channelCode': instance.channelCode,
      'channelProperties': instance.channelProperties,
      'account': instance.account,
    };

_$VirtualAccountModelImpl _$$VirtualAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualAccountModelImpl(
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      channelCode: json['channelCode'] as String,
      channelProperties: VirtualAccountPropertiesModel.fromJson(
          json['channelProperties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VirtualAccountModelImplToJson(
        _$VirtualAccountModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'channelCode': instance.channelCode,
      'channelProperties': instance.channelProperties,
    };

_$VirtualAccountPropertiesModelImpl
    _$$VirtualAccountPropertiesModelImplFromJson(Map<String, dynamic> json) =>
        _$VirtualAccountPropertiesModelImpl(
          customerName: json['customerName'] as String,
          virtualAccountNumber: json['virtualAccountNumber'] as String,
          expiresAt: DateTime.parse(json['expiresAt'] as String),
        );

Map<String, dynamic> _$$VirtualAccountPropertiesModelImplToJson(
        _$VirtualAccountPropertiesModelImpl instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'virtualAccountNumber': instance.virtualAccountNumber,
      'expiresAt': instance.expiresAt.toIso8601String(),
    };

_$ChannelPropertiesModelImpl _$$ChannelPropertiesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelPropertiesModelImpl(
      successReturnUrl: json['successReturnUrl'] as String,
    );

Map<String, dynamic> _$$ChannelPropertiesModelImplToJson(
        _$ChannelPropertiesModelImpl instance) =>
    <String, dynamic>{
      'successReturnUrl': instance.successReturnUrl,
    };

_$PaymentActionModelImpl _$$PaymentActionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentActionModelImpl(
      action: json['action'] as String?,
      urlType: json['urlType'] as String?,
      method: json['method'] as String?,
      url: json['url'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$$PaymentActionModelImplToJson(
        _$PaymentActionModelImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'urlType': instance.urlType,
      'method': instance.method,
      'url': instance.url,
      'qrCode': instance.qrCode,
    };
