import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_state.dart';

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
    emit(OrderDetailActionInProgress());
    try {
      final res = await _cashierRepository.completeOrder(id, dto);
      emit(OrderDetailActionSuccess(completeResponse: res));
    } catch (e) {
      emit(OrderDetailActionFailure(e.toString()));
    }
  }

  Future<void> cancelOrder(String id) async {
    emit(OrderDetailActionInProgress());
    try {
      final res = await _cashierRepository.cancelOrder(id);
      emit(OrderDetailActionSuccess(cancelResponse: res));
    } catch (e) {
      emit(OrderDetailActionFailure(e.toString()));
    }
  }
}
