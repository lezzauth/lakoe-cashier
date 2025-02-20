import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@freezed
class PurchaseDetail with _$PurchaseDetail {
  const factory PurchaseDetail({
    required PurchaseModel purchase,
    required PaymentRequest paymentRequest,
  }) = _PurchaseDetail;

  factory PurchaseDetail.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDetailFromJson(json);
}

@freezed
class FindAllPurchaseDto with _$FindAllPurchaseDto {
  const factory FindAllPurchaseDto({String? status}) = _FindAllPurchaseDto;
}

extension CopyWithExtension on FindAllPurchaseDto {
  FindAllPurchaseDto copyWith({String? status}) {
    return FindAllPurchaseDto(status: status ?? this.status);
  }
}

extension QueryStringExtension on FindAllPurchaseDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {"status": status};

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    required String id,
    required String paymentMethod,
    required String status,
    required String paidAmount,
    required String amount,
    required int period,
    required String startPeriod,
    required String endPeriod,
    required String ownerId,
    String? externalId,
    required String packageName,
    required String createdAt,
    required String updatedAt,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}

@freezed
class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required String id,
    required String created,
    required String updated,
    required String referenceId,
    required String businessId,
    required int amount,
    required String country,
    required String currency,
    required PaymentMethod paymentMethod,
    required String captureMethod,
    required String status,
    required List<ActionPayment> actions,
    List<Item>? items,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String type,
    required String created,
    required String updated,
    required String referenceId,
    Ewallet? ewallet,
    VirtualAccount? virtualAccount,
    required String reusability,
    required String status,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
class Ewallet with _$Ewallet {
  const factory Ewallet({
    required String channelCode,
    required ChannelProperties channelProperties,
    Map<String, dynamic>? account,
  }) = _Ewallet;

  factory Ewallet.fromJson(Map<String, dynamic> json) =>
      _$EwalletFromJson(json);
}

@freezed
class VirtualAccount with _$VirtualAccount {
  const factory VirtualAccount({
    required int amount,
    required String currency,
    required String channelCode,
    required VirtualAccountChannelProperties channelProperties,
  }) = _VirtualAccount;

  factory VirtualAccount.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountFromJson(json);
}

@freezed
class ChannelProperties with _$ChannelProperties {
  const factory ChannelProperties({
    required String successReturnUrl,
    String? failureReturnUrl,
  }) = _ChannelProperties;

  factory ChannelProperties.fromJson(Map<String, dynamic> json) =>
      _$ChannelPropertiesFromJson(json);
}

@freezed
class VirtualAccountChannelProperties with _$VirtualAccountChannelProperties {
  const factory VirtualAccountChannelProperties({
    required String customerName,
    required String virtualAccountNumber,
    required DateTime expiresAt,
  }) = _VirtualAccountChannelProperties;

  factory VirtualAccountChannelProperties.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountChannelPropertiesFromJson(json);
}

@freezed
class ActionPayment with _$ActionPayment {
  const factory ActionPayment({
    required String? action,
    required String? urlType,
    required String? method,
    String? url,
    String? qrCode,
  }) = _ActionPayment;

  factory ActionPayment.fromJson(Map<String, dynamic> json) =>
      _$ActionPaymentFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String referenceId,
    required String name,
    required String type,
    required String category,
    required String currency,
    required int quantity,
    required int price,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
