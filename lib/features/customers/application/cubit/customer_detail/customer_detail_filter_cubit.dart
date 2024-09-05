import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_filter_state.dart';

class CustomerDetailFilterCubit extends Cubit<CustomerDetailFilterState> {
  CustomerDetailFilterCubit() : super(const CustomerDetailFilterState());

  void setFilter({String? from, String? to}) {
    emit(CustomerDetailFilterState(from: from, to: to));
  }

  void clearFilter() {
    emit(const CustomerDetailFilterState());
  }
}
