import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_filter_state.dart';

class CustomerDetailFilterCubit extends Cubit<CustomerDetailFilterState> {
  CustomerDetailFilterCubit()
      : super(const CustomerDetailFilterState(template: "ALL"));

  void setFilter({
    DateTime? from,
    DateTime? to,
    required String template,
  }) {
    emit(CustomerDetailFilterState(
      from: from?.toUtc().toIso8601String(),
      to: to?.toUtc().toIso8601String(),
      template: template,
    ));
  }

  void clearFilter() {
    emit(const CustomerDetailFilterState(template: "ALL"));
  }
}
