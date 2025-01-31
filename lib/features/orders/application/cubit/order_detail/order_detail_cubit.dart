import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_state.dart';

class OrderDetailOpenedCubit extends Cubit<OrderDetailOpenedState> {
  OrderDetailOpenedCubit() : super(OrderDetailOpenedState(null));

  void selectOrderId(String selectedId) {
    emit(OrderDetailOpenedState(selectedId));
  }

  void unselectOrderId() {
    emit(OrderDetailOpenedState(null));
  }
}

class OrderDetailCubit extends Cubit<OrderDetailState> {
  final OrderRepository _orderRepository = OrderRepositoryImpl();
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  OrderDetailCubit() : super(OrderDetailInitial());

  Future<void> findOne(String id) async {
    try {
      emit(OrderDetailLoadInProgress());
      final order = await _orderRepository.findOne(id);
      emit(OrderDetailLoadSuccess(order: order));
    } catch (e) {
      emit(OrderDetailLoadFailure(e.toString()));
    }
  }

  Future<void> completeOrder(String id, CompleteOrderDto dto) async {
    try {
      emit(OrderDetailActionInProgress());
      final res = await _cashierRepository.completeOrder(id, dto);
      emit(OrderDetailActionSuccess(completeResponse: res));
    } catch (e) {
      emit(OrderDetailActionFailure(e.toString()));
    }
  }

  Future<void> cancelOrder(String id) async {
    try {
      emit(OrderDetailActionInProgress());
      final res = await _cashierRepository.cancelOrder(id);
      emit(OrderDetailActionSuccess(cancelResponse: res));
    } catch (e) {
      emit(OrderDetailActionFailure(e.toString()));
    }
  }
}
