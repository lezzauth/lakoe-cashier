import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:collection/collection.dart';
import 'package:product_repository/product_repository.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState(carts: []));

  Future<void> addCart(ProductModel product) async {
    List<CartModel> updatedCarts = List.from(state.carts);
    CartModel? cart = updatedCarts.firstWhereOrNull(
      (cart) => cart.product.id == product.id,
    );

    if (cart == null) {
      updatedCarts.add(CartModel(quantity: 1, product: product));
      emit(CartState(carts: updatedCarts));
      return;
    }
    emit(CartState(
        carts: updatedCarts.map((cart) {
      if (cart.product.id != product.id) return cart;
      return CartModel(quantity: cart.quantity + 1, product: cart.product);
    }).toList()));
  }

  Future<void> removeCart(ProductModel product) async {
    List<CartModel> updatedCarts = List.from(state.carts);
    CartModel? cart = updatedCarts.firstWhereOrNull(
      (cart) => cart.product.id == product.id,
    );

    if (cart == null) {
      log("cart productId: ${product.id} not found",
          name: "CartCubit.removeCart");
      return;
    }
    if (cart.quantity > 1) {
      emit(CartState(
          carts: updatedCarts.map(
        (cart) {
          if (cart.product.id != product.id) return cart;
          return CartModel(
            quantity: cart.quantity - 1,
            product: cart.product,
          );
        },
      ).toList()));
    } else {
      updatedCarts.removeWhere((item) => item.product.id == product.id);
      emit(CartState(carts: updatedCarts));
    }
  }

  Future<void> updateQuantity(ProductModel product, int quantity) async {
    List<CartModel> updatedCarts = List.from(state.carts);
    CartModel? cart = updatedCarts.firstWhereOrNull(
      (cart) => cart.product.id == product.id,
    );

    if (cart == null) {
      log("cart productId: ${product.id} not found",
          name: "CartCubit.updateQuantity");
      return;
    }
    if (quantity >= 1) {
      emit(CartState(
          carts: updatedCarts.map(
        (cart) {
          if (cart.product.id != product.id) return cart;
          return CartModel(
            quantity: quantity,
            product: cart.product,
          );
        },
      ).toList()));
    } else {
      updatedCarts.removeWhere((item) => item.product.id == product.id);
      emit(CartState(carts: updatedCarts));
    }
  }

  Future<void> updateNotes(ProductModel product, String notes) async {
    List<CartModel> updatedCarts = List.from(state.carts);
    CartModel? cart = updatedCarts.firstWhereOrNull(
      (cart) => cart.product.id == product.id,
    );

    if (cart == null) {
      log(
        "cart productId: ${product.id} not found",
        name: "CartCubit.updateNotes",
      );
      return;
    }
    emit(CartState(
        carts: updatedCarts.map(
      (cart) {
        if (cart.product.id != product.id) return cart;
        return CartModel(
          quantity: cart.quantity,
          notes: notes,
          product: cart.product,
        );
      },
    ).toList()));
  }

  void reset() {
    emit(const CartState(carts: []));
  }
}
