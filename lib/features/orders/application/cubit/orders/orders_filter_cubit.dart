import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';

class OrdersFilterCubit extends Cubit<OrdersFilterState> {
  OrdersFilterCubit() : super(const OrdersFilterState(sort: "NEWEST"));

  void setFilter({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
    String? template,
    DateTime? from,
    DateTime? to,
  }) {
    emit(OrdersFilterState(
      search: search ?? state.search,
      sort: sort ?? state.sort ?? "NEWEST",
      source: source ?? state.source,
      status: status ?? state.status,
      type: type ?? state.type,
      template: template ?? state.template,
      from: from?.toIso8601String(),
      to: to?.toIso8601String(),
    ));
  }

  void clearFilter() {
    emit(const OrdersFilterState(sort: "NEWEST"));
  }

  bool hasFilterChanged() {
    const defaultState = OrdersFilterState(sort: "NEWEST");

    final currentDto = state.toFindAllOrderDto;
    final defaultDto = defaultState.toFindAllOrderDto;

    return currentDto != defaultDto;
  }
}
