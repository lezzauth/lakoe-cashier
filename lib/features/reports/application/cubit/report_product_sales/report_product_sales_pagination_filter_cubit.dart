import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_filter_state.dart';

class ReportProductSalesPaginationFilterCubit
    extends Cubit<ReportProductSalesPaginationFilterState> {
  ReportProductSalesPaginationFilterCubit()
      : super(const ReportProductSalesPaginationFilterState(
          template: "ALL",
          status: "ALL",
        ));

  setFilter({
    String? status,
    String? template,
    DateTime? from,
    DateTime? to,
  }) {
    emit(ReportProductSalesPaginationFilterState(
      status: status ?? state.status,
      template: template ?? state.template,
      from: from?.toIso8601String(),
      to: to?.toIso8601String(),
    ));
  }

  void clearFilter() {
    emit(const ReportProductSalesPaginationFilterState(
      template: "ALL",
      status: "ALL",
    ));
  }
}
