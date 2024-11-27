import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';
import 'package:logman/logman.dart';

class OrdersFilterCubit extends Cubit<OrdersFilterState> {
  OrdersFilterCubit()
      : super(const OrdersFilterState(
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
    DateTime? startDate,
    DateTime? endDate,
  }) {
    Logman.instance.info("1 STATE rangeType is ${state.rangeType}");
    Logman.instance.info("2 rangeType is $rangeType");
    emit(OrdersFilterState(
      search: search ?? state.search,
      sort: sort ?? state.sort,
      source: source ?? state.source,
      status: status ?? state.status ?? "OPEN",
      type: type ?? state.type,
      rangeType: rangeType ?? state.rangeType,
      startDate: startDate!.toUtc().toIso8601String(),
      endDate: endDate!.toUtc().toIso8601String(),
    ));
  }

  void clearFilter() {
    emit(const OrdersFilterState(
      source: "CASHIER",
      sort: "NEWEST",
    ));
  }
}
