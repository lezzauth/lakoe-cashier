import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class FindAllProductDto with _$FindAllProductDto {
  const factory FindAllProductDto({
    required String outletId,
    int? categoryId,
    String? name,
    String? availability,
  }) = _FindAllProductDto;

  factory FindAllProductDto.fromJson(Map<String, Object?> json) =>
      _$FindAllProductDtoFromJson(json);
}

extension QueryStringExtension on FindAllProductDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class ListOrderByProductDto with _$ListOrderByProductDto {
  const factory ListOrderByProductDto({
    String? cursor,
    String? from,
    String? to,
    String? template,
  }) = _ListOrderByProductDto;

  factory ListOrderByProductDto.fromJson(Map<String, Object?> json) =>
      _$ListOrderByProductDtoFromJson(json);
}

extension ListOrderByProductDtoQueryStringExtension on ListOrderByProductDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

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
    int? stock,
    @Default("AVAILABLE") String availability,
  }) = _CreateProductDto;

  factory CreateProductDto.fromJson(Map<String, Object?> json) =>
      _$CreateProductDtoFromJson(json);
}

@freezed
class UpdateProductDto with _$UpdateProductDto {
  const factory UpdateProductDto({
    String? name,
    String? description,
    int? price,
    int? modal,
    int? categoryId,
    String? unit,
    String? outletId,
    String? sku,
    int? stock,
    String? availability,
  }) = _UpdateProductDto;

  factory UpdateProductDto.fromJson(Map<String, Object?> json) =>
      _$UpdateProductDtoFromJson(json);
}

extension ToJsonFilterExtension on UpdateProductDto {
  Map<String, dynamic> toJsonFilter() {
    final Map<String, dynamic> json = toJson();
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
