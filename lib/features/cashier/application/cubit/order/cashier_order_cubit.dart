import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_state.dart';
import 'package:logman/logman.dart';

class CashierOrderCubit extends Cubit<CashierOrderState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  CashierOrderCubit() : super(CashierOrderInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(CashierOrderLoadInProgress());
      final orders = await _cashierRepository.findAllOrderCashier(
          const FindAllOrderCashierDto(status: "OPEN", sort: "NEWEST"));
      emit(CashierOrderLoadSuccess(
        orders: orders,
      ));
    } catch (e) {
      Logman.instance
          .error("[CashierOrderCubit] Catch findAll(): ${e.toString()}");
      emit(CashierOrderLoadFailure(e.toString()));
    }
  }
}
