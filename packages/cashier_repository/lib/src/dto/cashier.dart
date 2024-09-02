import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashier.g.dart';
part 'cashier.freezed.dart';

// common
@freezed
class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    @Default("") String notes,
    required int quantity,
    required String productId,
  }) = _OrderItemDto;

  factory OrderItemDto.fromJson(Map<String, Object?> json) =>
      _$OrderItemDtoFromJson(json);
}

// Save Order
@freezed
class SaveOrderDto with _$SaveOrderDto {
  const factory SaveOrderDto({
    required String outletId,
    required List<OrderItemDto> items,
  }) = _SaveOrderDto;

  factory SaveOrderDto.fromJson(Map<String, Object?> json) =>
      _$SaveOrderDtoFromJson(json);
}

// Complete Order
@freezed
class CompleteOrderDto with _$CompleteOrderDto {
  const factory CompleteOrderDto({
    required String paymentMethod,
    required int paidAmount,
    required int change,
  }) = _CompleteOrderDto;

  factory CompleteOrderDto.fromJson(Map<String, Object?> json) =>
      _$CompleteOrderDtoFromJson(json);
}

// Open Cashier
@freezed
class OpenCashierDto with _$OpenCashierDto {
  const factory OpenCashierDto({
    required int initialBalance,
    required String outletId,
    required String pin,
  }) = _OpenCashierDto;

  factory OpenCashierDto.fromJson(Map<String, Object?> json) =>
      _$OpenCashierDtoFromJson(json);
}

// Generate Token
@freezed
class RegenerateCashierTokenDto with _$RegenerateCashierTokenDto {
  const factory RegenerateCashierTokenDto({
    required String outletId,
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
    required String outletId,
  }) = _CloseCashierDto;

  factory CloseCashierDto.fromJson(Map<String, Object?> json) =>
      _$CloseCashierDtoFromJson(json);
}

// Preview Order Price
@freezed
class PreviewOrderPriceDto with _$PreviewOrderPriceDto {
  const factory PreviewOrderPriceDto({
    required String outletId,
    required List<OrderItemDto> items,
  }) = _PreviewOrderPriceDto;

  factory PreviewOrderPriceDto.fromJson(Map<String, Object?> json) =>
      _$PreviewOrderPriceDtoFromJson(json);
}

@freezed
class FindAllOrderDto with _$FindAllOrderDto {
  const factory FindAllOrderDto({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
  }) = _FindAllOrderDto;
}

extension QueryStringExtension on FindAllOrderDto {
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
