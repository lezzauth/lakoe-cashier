import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_state.dart';

class OrderMasterCubit extends Cubit<OrderMasterState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  OrderMasterCubit() : super(OrderMasterInitial());

  Future<void> init() async {
    await findAll(const FindAllOrderDto(status: "OPEN"));
  }

  Future<void> findAll(FindAllOrderDto dto) async {
    try {
      emit(OrderMasterLoadInProgress());
      final orders = await _cashierRepository.findAllOrder(dto);
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