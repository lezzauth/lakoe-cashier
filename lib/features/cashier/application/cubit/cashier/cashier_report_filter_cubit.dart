import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';

class CashierReportFilterCubit extends Cubit<CashierReportFilterState> {
  CashierReportFilterCubit()
      : super(const CashierReportFilterState(template: "TODAY"));

  void setFilter({String? to, String? from, String? template}) {
    log(
      'to:$to, from:$from, template: $template',
      name: "CashierReportFilterCubit.setFilter",
    );
    emit(CashierReportFilterState(to: to, from: from, template: template));
  }
}
