import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_state.dart';

class OrderCashierCubit extends Cubit<OrderCashierState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  OrderCashierCubit() : super(OrderMasterInitial());

  Future<void> init() async {
    await findAll(const FindAllOrderCashierDto(
      status: "OPEN",
      source: "CASHIER",
      sort: "NEWEST",
    ));
  }

  Future<void> findAll(FindAllOrderCashierDto dto) async {
    try {
      emit(OrderMasterLoadInProgress());
      final orders = await _cashierRepository.findAllOrderCashier(dto);
      emit(
        OrderMasterLoadSuccess(
          orders: orders,
        ),
      );
    } catch (e) {
      emit(OrderMasterLoadFailure(e.toString()));
    }
  }
}
