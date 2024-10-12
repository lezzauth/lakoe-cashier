// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCreateModelImpl _$$OrderCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCreateModelImpl(
      order: OrderCreateOrder.fromJson(json['order'] as Map<String, dynamic>),
      transaction: OrderCreateTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>),
      invoice:
          OrderCreateInvoice.fromJson(json['invoice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderCreateModelImplToJson(
        _$OrderCreateModelImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'transaction': instance.transaction,
      'invoice': instance.invoice,
    };

_$OrderCreateOrderImpl _$$OrderCreateOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCreateOrderImpl(
      id: json['id'] as String,
      no: (json['no'] as num).toInt(),
      status: json['status'] as String,
      price: json['price'] as String,
      customerId: json['customerId'] as String?,
      paymentStatus: json['paymentStatus'] as String,
      customerType: json['customerType'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      outletId: json['outletId'] as String,
      tableId: json['tableId'] as String?,
      cashierId: json['cashierId'] as String?,
      shipmentId: json['shipmentId'] as String?,
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderCreateOrderImplToJson(
        _$OrderCreateOrderImpl instance) =>
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
      'invoiceNumber': instance.invoiceNumber,
      'outletId': instance.outletId,
      'tableId': instance.tableId,
      'cashierId': instance.cashierId,
      'shipmentId': instance.shipmentId,
      'closedAt': instance.closedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$OrderCreateTransactionImpl _$$OrderCreateTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCreateTransactionImpl(
      id: json['id'] as String,
      no: (json['no'] as num).toInt(),
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderCreateTransactionImplToJson(
        _$OrderCreateTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$OrderCreateInvoiceImpl _$$OrderCreateInvoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCreateInvoiceImpl(
      id: json['id'] as String,
      externalId: json['externalId'] as String,
      userId: json['userId'] as String,
      status: json['status'] as String,
      merchantName: json['merchantName'] as String,
      merchantProfilePictureUrl: json['merchantProfilePictureUrl'] as String,
      amount: (json['amount'] as num).toInt(),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      invoiceUrl: json['invoiceUrl'] as String,
      availableBanks: (json['availableBanks'] as List<dynamic>)
          .map(
              (e) => OrderCreateInvoiceBank.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableRetailOutlets: json['availableRetailOutlets'] as List<dynamic>,
      availableEwallets: json['availableEwallets'] as List<dynamic>,
      availableQrCodes: json['availableQrCodes'] as List<dynamic>,
      availableDirectDebits: json['availableDirectDebits'] as List<dynamic>,
      availablePaylaters: json['availablePaylaters'] as List<dynamic>,
      shouldExcludeCreditCard: json['shouldExcludeCreditCard'] as bool,
      shouldSendEmail: json['shouldSendEmail'] as bool,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$OrderCreateInvoiceImplToJson(
        _$OrderCreateInvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'userId': instance.userId,
      'status': instance.status,
      'merchantName': instance.merchantName,
      'merchantProfilePictureUrl': instance.merchantProfilePictureUrl,
      'amount': instance.amount,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'invoiceUrl': instance.invoiceUrl,
      'availableBanks': instance.availableBanks,
      'availableRetailOutlets': instance.availableRetailOutlets,
      'availableEwallets': instance.availableEwallets,
      'availableQrCodes': instance.availableQrCodes,
      'availableDirectDebits': instance.availableDirectDebits,
      'availablePaylaters': instance.availablePaylaters,
      'shouldExcludeCreditCard': instance.shouldExcludeCreditCard,
      'shouldSendEmail': instance.shouldSendEmail,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'currency': instance.currency,
    };

_$OrderCreateInvoiceBankImpl _$$OrderCreateInvoiceBankImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCreateInvoiceBankImpl(
      bankCode: json['bankCode'] as String,
      collectionType: json['collectionType'] as String,
      bankBranch: json['bankBranch'] as String,
      accountHolderName: json['accountHolderName'] as String,
      transferAmount: (json['transferAmount'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderCreateInvoiceBankImplToJson(
        _$OrderCreateInvoiceBankImpl instance) =>
    <String, dynamic>{
      'bankCode': instance.bankCode,
      'collectionType': instance.collectionType,
      'bankBranch': instance.bankBranch,
      'accountHolderName': instance.accountHolderName,
      'transferAmount': instance.transferAmount,
    };
