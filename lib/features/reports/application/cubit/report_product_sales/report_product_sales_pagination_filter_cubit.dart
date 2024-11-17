import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_filter_state.dart';

class ReportProductSalesPaginationFilterCubit
    extends Cubit<ReportProductSalesPaginationFilterState> {
  ReportProductSalesPaginationFilterCubit()
      : super(const ReportProductSalesPaginationFilterState(template: "ALL"));

  setFilter({DateTime? from, DateTime? to, required String template}) {
    emit(ReportProductSalesPaginationFilterState(
      from: from?.toUtc().toIso8601String(),
      to: to?.toUtc().toIso8601String(),
      template: template,
    ));
  }
}
