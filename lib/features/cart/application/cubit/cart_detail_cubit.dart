import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';

class CartDetailCubit extends Cubit<CartDetailState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  CartDetailCubit() : super(CartDetailInitial());

  Future<void> previewOrderPrice({
    required List<CartModel> carts,
    required String outletId,
    required String type,
  }) async {
    try {
      emit(CartDetailLoadInProgress());
      final previewOrderPrice = await _cashierRepository.previewOrderPrice(
        PreviewOrderPriceDto(
          outletId: outletId,
          type: type,
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

  SaveOrderDto _cartsToSaveOrderDto({
    required List<CartModel> carts,
    required String outletId,
    required String type,
    String? customerId,
  }) {
    return SaveOrderDto(
      outletId: outletId,
      type: type,
      customerId: customerId,
      items: carts
          .map(
            (cart) => OrderItemDto(
              quantity: cart.quantity,
              productId: cart.product.id,
              notes: cart.notes ?? "",
            ),
          )
          .toList(),
    );
  }

  Future<void> saveOrder({
    required List<CartModel> carts,
    required String outletId,
    required String type,
    String? customerId,
  }) async {
    try {
      emit(CartDetailActionInProgress());
      await _cashierRepository.saveOrder(_cartsToSaveOrderDto(
        carts: carts,
        outletId: outletId,
        type: type,
        customerId: customerId,
      ));
      emit(CartDetailActionSuccess());
    } catch (e, stackTrace) {
      log("saveOrder err: ${e.toString()}",
          name: "CartDetailCubit.saveOrder", stackTrace: stackTrace);
      emit(CartDetailActionFailure(e.toString()));
    }
  }

  Future<void> saveAndCompleteOrder({
    required List<CartModel> carts,
    required String outletId,
    required int paidAmount,
    required int change,
    required String paymentMethod,
    required String type,
    String? customerId,
  }) async {
    try {
      emit(CartDetailActionInProgress());
      final response = await _cashierRepository.saveAndCompleteOrder(
        _cartsToSaveOrderDto(
          carts: carts,
          outletId: outletId,
          type: type,
          customerId: customerId,
        ),
        CompleteOrderDto(
          paymentMethod: paymentMethod,
          paidAmount: paidAmount,
          change: change,
        ),
      );
      emit(CartDetailCompleteActionSuccess(response: response));
    } catch (e, stackTrace) {
      log("saveAndCompleteOrder err: ${e.toString()}",
          name: "CartDetailCubit.saveAndCompleteOrder", stackTrace: stackTrace);
      emit(CartDetailCompleteActionFailure(e.toString()));
    }
  }
}
