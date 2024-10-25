import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet.g.dart';
part 'outlet.freezed.dart';

@freezed
class OutletModel with _$OutletModel {
  const factory OutletModel({
    required String id,
    required String name,
    String? address,
    String? type,
    String? ownerId,
    String? logo,
    String? color,
    String? createdAt,
    String? updatedAt,
  }) = _OutletModel;

  factory OutletModel.fromJson(Map<String, Object?> json) =>
      _$OutletModelFromJson(json);
}

@freezed
class DetailCustomerCount with _$DetailCustomerCount {
  const factory DetailCustomerCount({
    required int orders,
  }) = _DetailCustomerCount;

  factory DetailCustomerCount.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerCountFromJson(json);
}

@freezed
class DetailCustomerOwner with _$DetailCustomerOwner {
  const factory DetailCustomerOwner({
    required int coin,
    required String ownerId,
  }) = _DetailCustomerOwner;

  factory DetailCustomerOwner.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOwnerFromJson(json);
}

@freezed
class DetailCustomerOrderCount with _$DetailCustomerOrderCount {
  const factory DetailCustomerOrderCount({
    required int items,
  }) = _DetailCustomerOrderCount;

  factory DetailCustomerOrderCount.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOrderCountFromJson(json);
}

@freezed
class DetailCustomerOrderTransaction with _$DetailCustomerOrderTransaction {
  const factory DetailCustomerOrderTransaction({
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
    required String createdAt,
    required String updatedAt,
  }) = _DetailCustomerOrderTransaction;

  factory DetailCustomerOrderTransaction.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOrderTransactionFromJson(json);
}

@freezed
class DetailCustomerOrder with _$DetailCustomerOrder {
  const factory DetailCustomerOrder({
    required String id,
    required int no,
    required String status,
    required String price,
    String? customerId,
    required String paymentStatus,
    required String customerType,
    required String type,
    required String source,
    required String outletId,
    String? tableId,
    required String cashierId,
    required String createdAt,
    required String updatedAt,
    required List<DetailCustomerOrderTransaction> transactions,
    @JsonKey(name: "_count") required DetailCustomerOrderCount count,
  }) = _DetailCustomerOrder;

  factory DetailCustomerOrder.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOrderFromJson(json);
}

@freezed
class DetailCustomer with _$DetailCustomer {
  const factory DetailCustomer({
    required String id,
    required String name,
    String? email,
    String? address,
    required String phoneNumber,
    required String createdAt,
    required String updatedAt,
    required List<DetailCustomerOrder> orders,
    required List<DetailCustomerOwner> owners,
    @JsonKey(name: "_count") required DetailCustomerCount count,
  }) = _DetailCustomer;

  factory DetailCustomer.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerFromJson(json);
}

@freezed
class DetailSummary with _$DetailSummary {
  const factory DetailSummary({
    required String totalPrice,
    required int count,
    required String favorite,
  }) = _DetailSummary;

  factory DetailSummary.fromJson(Map<String, Object?> json) =>
      _$DetailSummaryFromJson(json);
}

@freezed
class DetailCustomerOutletResponse with _$DetailCustomerOutletResponse {
  const factory DetailCustomerOutletResponse({
    required DetailCustomer customer,
    required DetailSummary summary,
  }) = _DetailCustomerOutletResponse;

  factory DetailCustomerOutletResponse.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOutletResponseFromJson(json);
}

// Outlet Report

@freezed
class OutletSalesModel with _$OutletSalesModel {
  const factory OutletSalesModel({
    required OutletReportTotalSaleModel totalSales,
    required OutletReportTotalTransactionModel totalTransactions,
    required OutletReportTimeWindow timeWindow,
  }) = _OutletSalesModel;

  factory OutletSalesModel.fromJson(Map<String, Object?> json) =>
      _$OutletSalesModelFromJson(json);
}

@freezed
class OutletReportTotalSaleModel with _$OutletReportTotalSaleModel {
  const factory OutletReportTotalSaleModel({
    required String current,
    required String past,
    int? diff,
  }) = _OutletReportTotalSaleModel;

  factory OutletReportTotalSaleModel.fromJson(Map<String, Object?> json) =>
      _$OutletReportTotalSaleModelFromJson(json);
}

@freezed
class OutletReportTotalTransactionModel
    with _$OutletReportTotalTransactionModel {
  const factory OutletReportTotalTransactionModel({
    required int current,
    required int past,
    int? diff,
  }) = _OutletReportTotalTransactionModel;

  factory OutletReportTotalTransactionModel.fromJson(
          Map<String, Object?> json) =>
      _$OutletReportTotalTransactionModelFromJson(json);
}

@freezed
class OutletReportTimeWindow with _$OutletReportTimeWindow {
  const factory OutletReportTimeWindow({
    required TimeRange current,
    required TimeRange past,
  }) = _OutletReportTimeWindow;

  factory OutletReportTimeWindow.fromJson(Map<String, dynamic> json) =>
      _$OutletReportTimeWindowFromJson(json);
}

@freezed
class TimeRange with _$TimeRange {
  const factory TimeRange({
    required String start,
    required String end,
  }) = _TimeRange;

  factory TimeRange.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeFromJson(json);
}

@freezed
class OutletReportModel with _$OutletReportModel {
  const factory OutletReportModel({
    required String totalSales,
    required String averageSales,
    required int totalProductSold,
    required int totalTransaction,
    required String totalProfit,
    required String totalPastSales,
    required int? totalSalesDiff,
    required List<OutletReportBestSalesProductModel> bestSalesProduct,
  }) = _OutletReportModel;

  factory OutletReportModel.fromJson(Map<String, dynamic> json) =>
      _$OutletReportModelFromJson(json);
}

@freezed
class OutletReportBestSalesProductModel
    with _$OutletReportBestSalesProductModel {
  const factory OutletReportBestSalesProductModel({
    required String id,
    required String name,
    required List<String> images,
    required int soldCount,
  }) = _OutletReportBestSalesProductModel;

  factory OutletReportBestSalesProductModel.fromJson(
          Map<String, dynamic> json) =>
      _$OutletReportBestSalesProductModelFromJson(json);
}
