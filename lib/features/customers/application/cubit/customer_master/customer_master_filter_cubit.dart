import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_filter_state.dart';

class CustomerMasterFilterCubit extends Cubit<CustomerMasterFilterState> {
  CustomerMasterFilterCubit() : super(const CustomerMasterFilterState());

  void setFilter({
    String? search,
  }) {
    emit(CustomerMasterFilterState(
      search: search ?? state.search,
    ));
  }

  void clearFilter() {
    emit(const CustomerMasterFilterState());
  }
}
