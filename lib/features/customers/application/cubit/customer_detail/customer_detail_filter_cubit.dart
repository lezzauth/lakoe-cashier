import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_detail/customer_detail_filter_state.dart';

class CustomerDetailFilterCubit extends Cubit<CustomerDetailFilterState> {
  CustomerDetailFilterCubit()
      : super(const CustomerDetailFilterState(template: "ALL"));

  DateTime convertToUtc(DateTime localDate) {
    return DateTime.utc(
      localDate.year,
      localDate.month,
      localDate.day,
      localDate.hour,
      localDate.minute,
      localDate.second,
      localDate.millisecond,
      localDate.microsecond,
    );
  }

  void setFilter({
    DateTime? from,
    DateTime? to,
    required String template,
  }) {
    emit(CustomerDetailFilterState(
      from: convertToUtc(from!).toIso8601String(),
      to: convertToUtc(to!).toIso8601String(),
      template: template,
    ));
  }

  void clearFilter() {
    emit(const CustomerDetailFilterState(template: "ALL"));
  }
}
