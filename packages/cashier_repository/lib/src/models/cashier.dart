import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashier.g.dart';
part 'cashier.freezed.dart';

@freezed
class OpenCashierResponse with _$OpenCashierResponse {
  const factory OpenCashierResponse({
    required String token,
  }) = _OpenCashierResponse;

  factory OpenCashierResponse.fromJson(Map<String, Object?> json) =>
      _$OpenCashierResponseFromJson(json);
}

@freezed
class OperatorModel with _$OperatorModel {
  const factory OperatorModel({
    required String id,
    required String role,
    required String name,
    required String phoneNumber,
    required String email,
    required bool emailVerified,
    required bool phoneVerified,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _OperatorModel;

  factory OperatorModel.fromJson(Map<String, Object?> json) =>
      _$OperatorModelFromJson(json);
}

mixin CashierFields {
  String get id;
  String get status;
  String get initialBalance;
  String get finalBalance;
  String get outletId;
  String get openedAt;
  String? get closedAt;
}

@freezed
class CashierModel with _$CashierModel, CashierFields {
  const factory CashierModel({
    required String id,
    required String status,
    required String initialBalance,
    required String finalBalance,
    required String outletId,
    required String openedAt,
    String? closedAt,
  }) = _CashierModel;

  factory CashierModel.fromJson(Map<String, Object?> json) =>
      _$CashierModelFromJson(json);
}

@freezed
class GetOpenCashierResponse with _$GetOpenCashierResponse, CashierFields {
  const factory GetOpenCashierResponse({
    required String id,
    required String status,
    required String initialBalance,
    required String finalBalance,
    required String outletId,
    required String openedAt,
    String? closedAt,
    required OperatorModel operator,
  }) = _GetOpenCashierResponse;

  factory GetOpenCashierResponse.fromJson(Map<String, Object?> json) =>
      _$GetOpenCashierResponseFromJson(json);
}
