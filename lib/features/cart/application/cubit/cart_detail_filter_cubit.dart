import 'package:customer_repository/customer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:table_repository/table_repository.dart';

class CartDetailFilterCubit extends Cubit<CartDetailFilterState> {
  CartDetailFilterCubit() : super(const CartDetailFilterState(type: "DINEIN"));

  void setType({
    String type = "DINEIN",
  }) {
    TableModel? modifiedTable = state.table;
    if (type == "TAKEAWAY") {
      modifiedTable = null;
    }

    emit(
      CartDetailFilterState(
        type: type,
        table: modifiedTable,
        customer: state.customer,
      ),
    );
  }

  void setCustomer({CustomerModel? customer}) {
    emit(
      CartDetailFilterState(
        customer: customer,
        table: state.table,
        type: state.type,
      ),
    );
  }

  void setTable({
    TableModel? table,
  }) {
    String modifiedType = state.type;

    if (table != null) {
      modifiedType = "DINEIN";
    }

    emit(CartDetailFilterState(
      customer: state.customer,
      table: table,
      type: modifiedType,
    ));
  }

  void clearFilter() {
    emit(const CartDetailFilterState(type: "DINEIN"));
  }
}
