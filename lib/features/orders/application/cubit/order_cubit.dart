import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final CashierRepository cashierRepository;

  OrderCubit({required this.cashierRepository}) : super(OrderInitial());

  Future<void> findAll(FindAllOrderDto dto) async {
    try {
      emit(OrderLoadInProgress());
      final orders = await cashierRepository.findAllOrder(dto);
      emit(OrderLoadSuccess(orders: orders, dto: dto));
    } catch (e, stackTrace) {
      log("findAll err: ${e.toString()}",
          name: "OrderCubit.findAll", stackTrace: stackTrace);
      emit(OrderLoadFailure(e.toString()));
    }
  }

  Future<void> refetch() async {
    OrderState currentState = state;

    if (currentState is! OrderLoadSuccess) return;
    await findAll(currentState.dto);
  }
}
