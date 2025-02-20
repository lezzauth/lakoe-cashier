import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class FindAllProductDto with _$FindAllProductDto {
  const factory FindAllProductDto({
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
    String? status,
    String? template,
    String? from,
    String? to,
  }) = _ListOrderByProductDto;

  factory ListOrderByProductDto.fromJson(Map<String, Object?> json) =>
      _$ListOrderByProductDtoFromJson(json);
}

extension CopyWithExtension on ListOrderByProductDto {
  ListOrderByProductDto copyWith({
    String? cursor,
    String? status,
    String? template,
    String? from,
    String? to,
  }) {
    return ListOrderByProductDto(
      cursor: cursor ?? this.cursor,
      status: status ?? this.status,
      template: template ?? this.template,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}

extension ListOrderByProductDtoQueryStringExtension on ListOrderByProductDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {
      "cursor": cursor,
      "status": status,
      "template": template,
      "from": from,
      "to": to,
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
    String? outletId,
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
