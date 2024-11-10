import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_repository/order_repository.dart';

part 'cashier.g.dart';
part 'cashier.freezed.dart';

// Save Order
@freezed
class SaveOrderDto with _$SaveOrderDto {
  const factory SaveOrderDto({
    String? outletId,
    required String type,
    required List<OrderItemDto> items,
    String? customerId,
    String? tableId,
  }) = _SaveOrderDto;

  factory SaveOrderDto.fromJson(Map<String, Object?> json) =>
      _$SaveOrderDtoFromJson(json);
}

sealed class CompleteOrderDto {}

// Complete Order
@freezed
class CompleteCashOrderDto extends CompleteOrderDto
    with _$CompleteCashOrderDto {
  const factory CompleteCashOrderDto({
    required String paymentMethod,
    required double paidAmount,
    required double change,
    String? customerId,
    String? redeemCoinAmount,
  }) = _CompleteCashOrderDto;

  factory CompleteCashOrderDto.fromJson(Map<String, Object?> json) =>
      _$CompleteCashOrderDtoFromJson(json);
}

@freezed
class CompleteBankTransferOrderDto extends CompleteOrderDto
    with _$CompleteBankTransferOrderDto {
  const factory CompleteBankTransferOrderDto({
    required File photo,
    required CompleteBankTransferOrderData data,
  }) = _CompleteBankTransferOrderDto;
}

@freezed
class CompleteBankTransferOrderData with _$CompleteBankTransferOrderData {
  const factory CompleteBankTransferOrderData({
    required String paymentMethod,
    required double paidAmount,
    required String accountNumber,
  }) = _CompleteBankTransferOrderData;

  factory CompleteBankTransferOrderData.fromJson(Map<String, Object?> json) =>
      _$CompleteBankTransferOrderDataFromJson(json);
}

@freezed
class CompleteDebitCreditOrderDto extends CompleteOrderDto
    with _$CompleteDebitCreditOrderDto {
  const factory CompleteDebitCreditOrderDto({
    required String paymentMethod,
    required double paidAmount,
    required String paidFrom,
    required String? approvalCode,
    @Default(0) double? change,
    required String accountNumber,
  }) = _CompleteDebitCreditOrderDto;

  factory CompleteDebitCreditOrderDto.fromJson(Map<String, Object?> json) =>
      _$CompleteDebitCreditOrderDtoFromJson(json);
}

@freezed
class CompleteQRCodeOrderDto extends CompleteOrderDto
    with _$CompleteQRCodeOrderDto {
  const factory CompleteQRCodeOrderDto({
    required String paymentMethod,
    required double paidAmount,
    required String paidFrom,
    required String? approvalCode,
    @Default(0) double? change,
  }) = _CompleteQRCodeOrderDto;

  factory CompleteQRCodeOrderDto.fromJson(Map<String, Object?> json) =>
      _$CompleteQRCodeOrderDtoFromJson(json);
}

// Open Cashier
@freezed
class OpenCashierDto with _$OpenCashierDto {
  const factory OpenCashierDto({
    required int initialBalance,
    String? outletId,
    required String pin,
  }) = _OpenCashierDto;

  factory OpenCashierDto.fromJson(Map<String, Object?> json) =>
      _$OpenCashierDtoFromJson(json);
}

// Generate Token
@freezed
class RegenerateCashierTokenDto with _$RegenerateCashierTokenDto {
  const factory RegenerateCashierTokenDto({
    String? outletId,
    required String pin,
  }) = _RegenerateCashierTokenDto;

  factory RegenerateCashierTokenDto.fromJson(Map<String, Object?> json) =>
      _$RegenerateCashierTokenDtoFromJson(json);
}

// Close Cashier
@freezed
class CloseCashierDto with _$CloseCashierDto {
  const factory CloseCashierDto({
    required int finalBalance,
    String? outletId,
  }) = _CloseCashierDto;

  factory CloseCashierDto.fromJson(Map<String, Object?> json) =>
      _$CloseCashierDtoFromJson(json);
}

// Preview Order Price
@freezed
class FindAllOrderCashierDto with _$FindAllOrderCashierDto {
  const factory FindAllOrderCashierDto({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
  }) = _FindAllOrderCashierDto;
}

extension CopyWithExtension on FindAllOrderCashierDto {
  FindAllOrderCashierDto copyWith({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
  }) {
    return FindAllOrderCashierDto(
      type: type ?? this.type,
      source: source ?? this.source,
      status: status ?? this.status,
      search: search ?? this.search,
      sort: sort ?? this.sort,
    );
  }
}

extension QueryStringExtension on FindAllOrderCashierDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {
      "type": type,
      "source": source,
      "status": status,
      "search": search,
      "sort": sort,
    };

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}
