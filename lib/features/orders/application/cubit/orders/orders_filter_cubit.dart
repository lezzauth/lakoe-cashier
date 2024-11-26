import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';

class OrdersFilterCubit extends Cubit<OrdersFilterState> {
  OrdersFilterCubit()
      : super(const OrdersFilterState(
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
    String? rangeType,
    String? startDate,
    String? endDate,
  }) {
    emit(OrdersFilterState(
      search: search ?? state.search,
      sort: sort ?? state.sort,
      source: source ?? state.source,
      status: status ?? state.status ?? "OPEN",
      type: type ?? state.type,
      rangeType: rangeType ?? state.rangeType,
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
    ));
  }

  void clearFilter() {
    emit(const OrdersFilterState(status: "OPEN"));
  }
}
