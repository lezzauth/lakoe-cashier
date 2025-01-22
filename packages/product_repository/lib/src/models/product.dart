import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    String? sku,
    required String price,
    required String modal,
    String? description,
    String? unit,
    required int categoryId,
    int? stock,
    required List<String> images,
    required String outletId,
    required String availability,
    required String profit,
    String? favoriteCustomerId,
    required int sold,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ProductOrderModel with _$ProductOrderModel {
  const factory ProductOrderModel({
    required String orderId,
    required String customerName,
    required String createdAt,
    required String status,
    required String paymentStatus,
    String? paymentMethod,
    required int itemTotal,
    required String price,
  }) = _ProductOrderModel;

  factory ProductOrderModel.fromJson(Map<String, Object?> json) =>
      _$ProductOrderModelFromJson(json);
}

@freezed
class ListOrderByProductResponse with _$ListOrderByProductResponse {
  const factory ListOrderByProductResponse({
    String? nextCursor,
    required List<ProductOrderModel> data,
  }) = _ListOrderByProductResponse;

  factory ListOrderByProductResponse.fromJson(Map<String, Object?> json) =>
      _$ListOrderByProductResponseFromJson(json);
}
