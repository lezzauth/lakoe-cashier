import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
class PackageActive with _$PackageActive {
  const factory PackageActive({
    required String name,
    int? orders,
    int? products,
    int? employees,
    int? customers,
    int? tables,
    int? hardwareIntegration,
    required int price,
    Purchase? purchase,
    String? endPeriod,
    required ActivePeriod activePeriod,
  }) = _PackageActive;

  factory PackageActive.fromJson(Map<String, dynamic> json) =>
      _$PackageActiveFromJson(json);
}

@freezed
class Purchase with _$Purchase {
  const factory Purchase({
    required String id,
    required String paymentMethod,
    required String paidAmount,
    required int period,
    required DateTime startPeriod,
    required DateTime endPeriod,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
}

@freezed
class ActivePeriod with _$ActivePeriod {
  const factory ActivePeriod({
    int? months,
    int? days,
  }) = _ActivePeriod;

  factory ActivePeriod.fromJson(Map<String, dynamic> json) =>
      _$ActivePeriodFromJson(json);
}
