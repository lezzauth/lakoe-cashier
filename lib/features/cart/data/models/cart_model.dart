import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_repository/product_repository.dart';

part 'cart_model.freezed.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required int quantity,
    String? notes,
    required ProductModel product,
  }) = _CartModel;
}
