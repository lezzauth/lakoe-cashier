import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_state.dart';

class OrderCashierFilterCubit extends Cubit<OrderCashierFilterState> {
  OrderCashierFilterCubit()
      : super(const OrderCashierFilterState(
          status: "OPEN",
          source: "CASHIER",
          sort: "NEWEST",
        ));

  void setFilter({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
    String? template,
    DateTime? to,
    DateTime? from,
  }) {
    emit(OrderCashierFilterState(
      search: search ?? state.search,
      sort: sort ?? state.sort,
      source: source ?? state.source,
      status: status ?? state.status ?? "OPEN",
      type: type ?? state.type,
      template: template ?? state.template,
      to: to?.toIso8601String(),
      from: from?.toIso8601String(),
    ));
  }

  void clearFilter() {
    emit(const OrderCashierFilterState(
      status: "OPEN",
      source: "CASHIER",
      sort: "NEWEST",
    ));
  }
}
