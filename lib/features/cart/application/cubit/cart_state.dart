import 'package:equatable/equatable.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';

class CartState extends Equatable {
  final List<CartModel> carts;

  const CartState({required this.carts});

  @override
  List<Object?> get props => [carts];
}
