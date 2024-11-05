import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

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

extension CopyWithExtension on FindAllOrderDto {
  FindAllOrderDto copyWith({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
  }) {
    return FindAllOrderDto(
      type: type ?? this.type,
      source: source ?? this.source,
      status: status ?? this.status,
      search: search ?? this.search,
      sort: sort ?? this.sort,
    );
  }
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
