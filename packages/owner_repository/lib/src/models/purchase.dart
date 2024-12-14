import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@freezed
class HistoryPurchaseModel with _$HistoryPurchaseModel {
  const factory HistoryPurchaseModel({
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
  }) = _HistoryPurchaseModel;

  factory HistoryPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryPurchaseModelFromJson(json);
}
