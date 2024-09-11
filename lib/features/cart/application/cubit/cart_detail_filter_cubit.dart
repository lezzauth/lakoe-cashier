import 'package:customer_repository/customer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:table_repository/table_repository.dart';

class CartDetailFilterCubit extends Cubit<CartDetailFilterState> {
  CartDetailFilterCubit() : super(const CartDetailFilterState(type: "DINEIN"));

  void setFilter({
    String? type = "DINEIN",
    CustomerModel? customer,
    TableModel? table,
  }) {
    String? modifiedType = type;
    TableModel? modifiedTable = table;
    if (table != null) {
      modifiedType = "DINEIN";
    }
    if (type == "TAKEAWAY") {
      table = null;
    }

    emit(CartDetailFilterState(
      customer: customer ?? state.customer,
      table: modifiedTable ?? state.table,
      type: modifiedType ?? state.type,
    ));
  }

  void clearFilter() {
    emit(const CartDetailFilterState(type: "DINEIN"));
  }
}
