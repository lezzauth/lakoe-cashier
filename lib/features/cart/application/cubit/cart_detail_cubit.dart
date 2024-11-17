import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';

class CartDetailCubit extends Cubit<CartDetailState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();
  final OrderRepository _orderRepository = OrderRepositoryImpl();

  CartDetailCubit() : super(CartDetailInitial());

  Future<void> previewOrderPrice({
    required List<CartModel> carts,
    required String type,
  }) async {
    try {
      emit(CartDetailLoadInProgress());
      final previewOrderPrice = await _orderRepository.previewOrderPrice(
        PreviewOrderPriceDto(
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
    required String type,
    String? customerId,
    String? tableId,
  }) {
    return SaveOrderDto(
      type: type,
      customerId: customerId,
      tableId: tableId,
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
    required String type,
    String? customerId,
    String? tableId,
  }) async {
    try {
      emit(CartDetailActionInProgress());
      await _cashierRepository.saveOrder(_cartsToSaveOrderDto(
        carts: carts,
        type: type,
        customerId: customerId,
        tableId: tableId,
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
    required String type,
    required CompleteOrderDto dto,
    String? customerId,
    String? tableId,
  }) async {
    try {
      emit(CartDetailActionInProgress());
      final res = await _cashierRepository.saveAndCompleteOrder(
        _cartsToSaveOrderDto(
          carts: carts,
          type: type,
          customerId: customerId,
          tableId: tableId,
        ),
        dto,
      );
      emit(CartDetailCompleteActionSuccess(res: res));
    } catch (e, stackTrace) {
      log("saveAndCompleteOrder err: ${e.toString()}",
          name: "CartDetailCubit.saveAndCompleteOrder", stackTrace: stackTrace);
      emit(CartDetailCompleteActionFailure(e.toString()));
    }
  }
}
