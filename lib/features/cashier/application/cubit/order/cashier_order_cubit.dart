import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_state.dart';

class CashierOrderCubit extends Cubit<CashierOrderState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  CashierOrderCubit() : super(CashierOrderInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(CashierOrderLoadInProgress());
      final orders = await _cashierRepository
          .findAllOrderCashier(const FindAllOrderCashierDto(status: "OPEN"));
      emit(CashierOrderLoadSuccess(
        orders: orders,
      ));
    } catch (e, stackTrace) {
      log("findAll err: ${e.toString()}",
          name: "OrderCubit.findAll", stackTrace: stackTrace);
      emit(CashierOrderLoadFailure(e.toString()));
    }
  }
}
