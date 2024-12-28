import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logman/logman.dart';
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
    } catch (e, s) {
      String errorMessage = "An unexpected error occurred.";

      if (e is DioException) {
        if (e.error is DioExceptionModel) {
          final dioExceptionModel = e.error as DioExceptionModel;
          errorMessage =
              "${dioExceptionModel.message} (${dioExceptionModel.statusCode}).";
        } else if (e.response?.statusCode == 402) {
          errorMessage = "Quota limit has been reached. (402)";
        } else {
          errorMessage = e.response?.data['message'] ??
              "An unexpected DioException occurred.";
        }
      } else {
        Logman.instance.error("ERROR SAVE ORDER $e, ---> $s");
      }
      emit(CartDetailActionFailure(errorMessage));
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
    } catch (e, s) {
      String errorMessage = "An unexpected error occurred.";

      if (e is DioException) {
        if (e.error is DioExceptionModel) {
          final dioExceptionModel = e.error as DioExceptionModel;
          errorMessage =
              "${dioExceptionModel.message} (${dioExceptionModel.statusCode}).";
        } else if (e.response?.statusCode == 402) {
          errorMessage = "Quota limit has been reached. (402)";
        } else {
          errorMessage = e.response?.data['message'] ??
              "An unexpected DioException occurred.";
        }
      } else {
        Logman.instance.error("ERROR SAVE ORDER $e, ---> $s");
      }
      emit(CartDetailCompleteActionFailure(errorMessage));
    }
  }
}
