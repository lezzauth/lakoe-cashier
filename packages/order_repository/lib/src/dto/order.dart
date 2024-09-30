import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

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

@freezed
class PreviewOrderPriceDto with _$PreviewOrderPriceDto {
  const factory PreviewOrderPriceDto({
    required String type,
    String? outletId,
    required List<OrderItemDto> items,
  }) = _PreviewOrderPriceDto;

  factory PreviewOrderPriceDto.fromJson(Map<String, Object?> json) =>
      _$PreviewOrderPriceDtoFromJson(json);
}
