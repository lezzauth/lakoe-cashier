import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_filter_state.dart';

class OrderMasterFilterCubit extends Cubit<OrderMasterFilterState> {
  OrderMasterFilterCubit()
      : super(const OrderMasterFilterState(status: "OPEN"));

  void setFilter({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
  }) {
    emit(OrderMasterFilterState(
      search: search ?? state.search,
      sort: sort ?? state.sort,
      source: source ?? state.source,
      status: status ?? state.status ?? "OPEN",
      type: type ?? state.type,
    ));
  }

  void clearFilter() {
    emit(const OrderMasterFilterState(status: "OPEN"));
  }
}
