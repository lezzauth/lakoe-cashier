import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_add_item/order_add_item_state.dart';

class OrderEditCubit extends Cubit<OrderEditState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  OrderEditCubit() : super(OrderEditInitial());

  Future<void> editOrder(String id, List<OrderItemDto> dto) async {
    try {
      emit(OrderEditActionInProgress());
      await _cashierRepository.editOrder(id, dto);
      emit(OrderEditActionSuccess());
    } catch (e) {
      emit(OrderEditActionFailure(e.toString()));
    }
  }
}
