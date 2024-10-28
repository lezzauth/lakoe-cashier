import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_add_item/order_add_item_state.dart';

class OrderEditCubit extends Cubit<OrderEditState> {
  final OrderRepository _orderRepository = OrderRepositoryImpl();

  OrderEditCubit() : super(OrderEditInitial());

  Future<void> addItems(String id, List<OrderItemDto> dto) async {
    try {
      log('xxx OrderEditCubit.addItems | id: $id | dto: $dto');
      emit(OrderEditActionInProgress());
      await _orderRepository.addItems(id, dto);
      emit(OrderEditActionSuccess());
    } catch (e) {
      emit(OrderEditActionFailure(e.toString()));
    }
  }
}
