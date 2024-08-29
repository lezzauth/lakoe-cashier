import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class FindAllProductDto with _$FindAllProductDto {
  const factory FindAllProductDto({
    required String outletId,
    int? categoryId,
    String? name,
  }) = _FindAllProductDto;
}

extension QueryStringExtension on FindAllProductDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {
      "outletId": outletId,
      "categoryId": categoryId,
      "name": name,
    };

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class CreateProductDto with _$CreateProductDto {
  const factory CreateProductDto({
    required String name,
    String? description,
    required int price,
    required int modal,
    required int categoryId,
    required String unit,
    required String outletId,
    String? sku,
  }) = _CreateProductDto;

  factory CreateProductDto.fromJson(Map<String, Object?> json) =>
      _$CreateProductDtoFromJson(json);
}
