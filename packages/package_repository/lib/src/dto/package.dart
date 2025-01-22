import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.g.dart';
part 'package.freezed.dart';

@freezed
class DetailPackagegeDto with _$DetailPackagegeDto {
  const factory DetailPackagegeDto({
    required String name,
  }) = _DetailPackagegeDto;

  factory DetailPackagegeDto.fromJson(Map<String, dynamic> json) =>
      _$DetailPackagegeDtoFromJson(json);
}

@freezed
class PurchaseDto with _$PurchaseDto {
  const factory PurchaseDto({
    required int period,
    required String paymentMethod,
    String? successReturnUrl,
    String? failedReturnUrl,
  }) = _PurchaseDto;

  factory PurchaseDto.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDtoFromJson(json);
}
