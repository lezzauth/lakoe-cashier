import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_filter_state.dart';

class CartCustomerFilterCubit extends Cubit<CartCustomerFilterState> {
  CartCustomerFilterCubit() : super(const CartCustomerFilterState());

  void setFilter({String? search}) {
    emit(CartCustomerFilterState(search: search ?? state.search));
  }
}
