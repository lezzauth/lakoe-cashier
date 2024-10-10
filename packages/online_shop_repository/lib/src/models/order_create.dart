import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_create.freezed.dart';
part 'order_create.g.dart';

@freezed
class OrderCreateModel with _$OrderCreateModel {
  const factory OrderCreateModel({
    required OrderCreateOrder order,
    required OrderCreateTransaction transaction,
    required OrderCreateInvoice invoice,
  }) = _OrderCreateModel;

  factory OrderCreateModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateModelFromJson(json);
}

@freezed
class OrderCreateOrder with _$OrderCreateOrder {
  const factory OrderCreateOrder({
    required String id,
    required int no,
    required String status,
    required String price,
    String? customerId,
    required String paymentStatus,
    required String customerType,
    required String type,
    required String source,
    required String invoiceNumber,
    required String outletId,
    String? tableId,
    String? cashierId,
    String? shipmentId,
    DateTime? closedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OrderCreateOrder;

  factory OrderCreateOrder.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateOrderFromJson(json);
}

@freezed
class OrderCreateTransaction with _$OrderCreateTransaction {
  const factory OrderCreateTransaction({
    required String id,
    required int no,
    required String paymentMethod,
    required String status,
    required String paidAmount,
    required String paidFrom,
    required String amount,
    required String change,
    String? accountNumber,
    String? photo,
    required String orderId,
    required String outletId,
    String? externalId,
    String? approvalCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OrderCreateTransaction;

  factory OrderCreateTransaction.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateTransactionFromJson(json);
}

@freezed
class OrderCreateInvoice with _$OrderCreateInvoice {
  const factory OrderCreateInvoice({
    required String id,
    required String externalId,
    required String userId,
    required String status,
    required String merchantName,
    required String merchantProfilePictureUrl,
    required int amount,
    required DateTime expiryDate,
    required String invoiceUrl,
    required List<OrderCreateInvoiceBank> availableBanks,
    required List<dynamic> availableRetailOutlets,
    required List<dynamic> availableEwallets,
    required List<dynamic> availableQrCodes,
    required List<dynamic> availableDirectDebits,
    required List<dynamic> availablePaylaters,
    required bool shouldExcludeCreditCard,
    required bool shouldSendEmail,
    required DateTime created,
    required DateTime updated,
    required String currency,
  }) = _OrderCreateInvoice;

  factory OrderCreateInvoice.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateInvoiceFromJson(json);
}

@freezed
class OrderCreateInvoiceBank with _$OrderCreateInvoiceBank {
  const factory OrderCreateInvoiceBank({
    required String bankCode,
    required String collectionType,
    required String bankBranch,
    required String accountHolderName,
    required int transferAmount,
  }) = _OrderCreateInvoiceBank;

  factory OrderCreateInvoiceBank.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateInvoiceBankFromJson(json);
}
