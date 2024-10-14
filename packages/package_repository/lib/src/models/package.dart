import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.g.dart';
part 'package.freezed.dart';

@freezed
class PackageModel with _$PackageModel {
  const factory PackageModel({
    required String name,
    int? orders,
    int? products,
    required int employees,
    int? customers,
    required int tables,
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
