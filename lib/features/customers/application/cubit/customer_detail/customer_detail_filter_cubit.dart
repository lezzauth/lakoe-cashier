import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_detail/customer_detail_filter_state.dart';

class CustomerDetailFilterCubit extends Cubit<CustomerDetailFilterState> {
  CustomerDetailFilterCubit()
      : super(const CustomerDetailFilterState(template: "ALL", status: "ALL"));

  void setFilter({
    String? status,
    String? template,
    DateTime? from,
    DateTime? to,
  }) {
    emit(CustomerDetailFilterState(
      status: status ?? state.status,
      template: template ?? state.template,
      from: from?.toIso8601String(),
      to: to?.toIso8601String(),
    ));
  }

  void clearFilter() {
    emit(const CustomerDetailFilterState(template: "ALL", status: "ALL"));
  }
}
