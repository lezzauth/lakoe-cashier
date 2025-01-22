import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_state.dart';
import 'package:order_repository/order_repository.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepository _orderRepository = OrderRepositoryImpl();

  OrdersCubit() : super(OrdersStateInitial());

  Future<void> init() async {
    await findAll(FindAllOrderDto(sort: "NEWEST"));
  }

  Future<void> findAll(FindAllOrderDto dto) async {
    try {
      emit(OrdersLoadInProgress());
      final orders = await _orderRepository.findAll(dto);
      emit(OrdersLoadSuccess(orders: orders));
    } catch (e) {
      emit(OrdersLoadFailure(e.toString()));
    }
  }
}
