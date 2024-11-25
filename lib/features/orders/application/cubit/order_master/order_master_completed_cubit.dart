import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_master/order_master_completed_state.dart';
import 'package:order_repository/order_repository.dart';

class OrderMasterCompletedCubit extends Cubit<OrderMasterCompletedState> {
  final OrderRepository _orderRepository = OrderRepositoryImpl();

  OrderMasterCompletedCubit() : super(OrderMasterCompletedInitial());

  Future<void> init() async {
    await findAll(FindAllOrderDto(sort: "NEWEST"));
  }

  Future<void> findAll(FindAllOrderDto dto) async {
    try {
      emit(OrderMasterCompletedLoadInProgress());
      final orders = await _orderRepository.findAll(dto);
      emit(OrderMasterCompletedLoadSuccess(orders: orders));
    } catch (e) {
      emit(OrderMasterCompletedLoadFailure(e.toString()));
    }
  }
}
