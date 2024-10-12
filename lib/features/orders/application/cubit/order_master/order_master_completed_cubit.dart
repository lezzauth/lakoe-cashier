import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_completed_state.dart';

class OrderMasterCompletedCubit extends Cubit<OrderMasterCompletedState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  OrderMasterCompletedCubit() : super(OrderMasterCompletedInitial());

  Future<void> init() async {
    await findAll(
        const FindAllOrderDto(status: "COMPLETED", source: "CASHIER"));
  }

  Future<void> findAll(FindAllOrderDto dto) async {
    try {
      emit(OrderMasterCompletedLoadInProgress());
      final orders = await _cashierRepository.findAllOrder(dto);
      emit(
        OrderMasterCompletedLoadSuccess(
          orders: orders,
        ),
      );
    } catch (e) {
      emit(OrderMasterCompletedLoadFailure(e.toString()));
    }
  }
}
