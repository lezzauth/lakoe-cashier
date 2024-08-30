import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';

class CartDetailCubit extends Cubit<CartDetailState> {
  final CashierRepository cashierRepository;

  CartDetailCubit({required this.cashierRepository})
      : super(CartDetailInitial());

  Future<void> previewOrderPrice({
    required List<CartModel> carts,
    required String outletId,
  }) async {
    try {
      emit(CartDetailLoadInProgress());
      final previewOrderPrice = await cashierRepository.previewOrderPrice(
        PreviewOrderPriceDto(
          outletId: outletId,
          items: carts
              .map(
                (cart) => OrderItemDto(
                    quantity: cart.quantity, productId: cart.product.id),
              )
              .toList(),
        ),
      );
      emit(CartDetailLoadSuccess(previewOrderPrice: previewOrderPrice));
    } catch (e, stackTrace) {
      log("previewOrderPrice err: ${e.toString()}",
          name: "CartDetailCubit.previewOrderPrice", stackTrace: stackTrace);
      emit(CartDetailLoadFailure(e.toString()));
    }
  }

  Future<void> saveOrder({
    required List<CartModel> carts,
    required String outletId,
  }) async {
    try {
      emit(CartDetailActionInProgress());
      await cashierRepository.saveOrder(SaveOrderDto(
        outletId: outletId,
        items: carts
            .map(
              (cart) => OrderItemDto(
                  quantity: cart.quantity, productId: cart.product.id),
            )
            .toList(),
      ));
      emit(CartDetailActionSuccess());
    } catch (e, stackTrace) {
      log("saveOrder err: ${e.toString()}",
          name: "CartDetailCubit.saveOrder", stackTrace: stackTrace);
      emit(CartDetailActionFailure(e.toString()));
    }
  }
}
