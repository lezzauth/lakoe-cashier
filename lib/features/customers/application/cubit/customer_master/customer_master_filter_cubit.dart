import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_filter_state.dart';

class CustomerMasterFilterCubit extends Cubit<CustomerMasterFilterState> {
  CustomerMasterFilterCubit() : super(const CustomerMasterFilterState());

  void setFilter({
    String? name,
  }) {
    emit(CustomerMasterFilterState(
      name: name ?? state.name,
    ));
  }

  void clearFilter() {
    emit(const CustomerMasterFilterState());
  }
}
