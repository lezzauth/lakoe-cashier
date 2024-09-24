import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_add_item/order_add_item_state.dart';

class OrderAddItemCubit extends Cubit<OrderAddItemState> {
  final OrderRepository _orderRepository = OrderRepositoryImpl();

  OrderAddItemCubit() : super(OrderAddItemInitial());

  Future<void> addItems(String id, List<OrderItemDto> dto) async {
    try {
      log('OrderAddItemCubit.addItems | id: $id | dto: $dto');
      emit(OrderAddItemActionInProgress());
      await _orderRepository.addItems(id, dto);
      emit(OrderAddItemActionSuccess());
    } catch (e) {
      emit(OrderAddItemActionFailure(e.toString()));
    }
  }
}
