import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_state.dart';
import 'package:order_repository/order_repository.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepository _orderRepository = OrderRepositoryImpl();

  OrdersCubit() : super(OrderMasterCompletedInitial());

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
