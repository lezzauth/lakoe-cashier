import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.g.dart';
part 'package.freezed.dart';

@freezed
class PackageModel with _$PackageModel {
  const factory PackageModel({
    required String name,
    int? orders,
    int? products,
    int? employees,
    int? customers,
    int? tables,
    int? hardwareIntergation,
    required int price,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}

@freezed
class PackagePriceModel with _$PackagePriceModel {
  const factory PackagePriceModel({
    required String name,
    required int discount,
    required int period,
    required int save,
    required int originPrice,
    required int pricePerMonth,
    required int savePerMonth,
    required int price,
    required DateTime startPeriod,
    required DateTime endPeriod,
  }) = _PackagePriceModel;

  factory PackagePriceModel.fromJson(Map<String, dynamic> json) =>
      _$PackagePriceModelFromJson(json);
}

@freezed
class PurchaseResponseModel with _$PurchaseResponseModel {
  const factory PurchaseResponseModel({
    required PurchaseModel purchase,
    required PaymentRequestModel paymentRequest,
  }) = _PurchaseResponseModel;

  factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseResponseModelFromJson(json);
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
    required DateTime startPeriod,
    required DateTime endPeriod,
    required String ownerId,
    String? externalId,
    required String packageName,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}

@freezed
class PaymentRequestModel with _$PaymentRequestModel {
  const factory PaymentRequestModel({
    required String id,
    required DateTime created,
    required DateTime updated,
    required String referenceId,
    required String businessId,
    required int amount,
    required String country,
    required String currency,
    required PaymentMethodModel paymentMethod,
    required String captureMethod,
    required String status,
    required List<PaymentActionModel> actions,
  }) = _PaymentRequestModel;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestModelFromJson(json);
}

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    required String id,
    required String type,
    required DateTime created,
    required DateTime updated,
    required String referenceId,
    EWalletModel? ewallet,
    VirtualAccountModel? virtualAccount,
    required String reusability,
    required String status,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);
}

@freezed
class EWalletModel with _$EWalletModel {
  const factory EWalletModel({
    required String channelCode,
    required ChannelPropertiesModel channelProperties,
    Map<String, dynamic>? account,
  }) = _EWalletModel;

  factory EWalletModel.fromJson(Map<String, dynamic> json) =>
      _$EWalletModelFromJson(json);
}

@freezed
class VirtualAccountModel with _$VirtualAccountModel {
  const factory VirtualAccountModel({
    required int amount,
    required String currency,
    required String channelCode,
    required VirtualAccountPropertiesModel channelProperties,
  }) = _VirtualAccountModel;

  factory VirtualAccountModel.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountModelFromJson(json);
}

@freezed
class VirtualAccountPropertiesModel with _$VirtualAccountPropertiesModel {
  const factory VirtualAccountPropertiesModel({
    required String customerName,
    required String virtualAccountNumber,
    required DateTime expiresAt,
  }) = _VirtualAccountPropertiesModel;

  factory VirtualAccountPropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountPropertiesModelFromJson(json);
}

@freezed
class ChannelPropertiesModel with _$ChannelPropertiesModel {
  const factory ChannelPropertiesModel({
    required String successReturnUrl,
  }) = _ChannelPropertiesModel;

  factory ChannelPropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelPropertiesModelFromJson(json);
}

@freezed
class PaymentActionModel with _$PaymentActionModel {
  const factory PaymentActionModel({
    required String? action,
    required String? urlType,
    required String? method,
    required String? url,
    String? qrCode,
  }) = _PaymentActionModel;

  factory PaymentActionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentActionModelFromJson(json);
}

@freezed
class DetailPurchaseModel with _$DetailPurchaseModel {
  const factory DetailPurchaseModel({
    required PurchaseModel purchase,
    required PaymentRequestModel paymentRequest,
  }) = _DetailPurchaseModel;

  factory DetailPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailPurchaseModelFromJson(json);
}
