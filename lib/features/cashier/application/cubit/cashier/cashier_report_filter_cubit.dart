import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';

class CashierReportFilterCubit extends Cubit<CashierReportFilterState> {
  CashierReportFilterCubit()
      : super(
            const CashierReportFilterState(template: "TODAY", preset: "TODAY"));

  void setFilter({
    DateTime? to,
    DateTime? from,
    String? template,
    int? duration,
    String? preset,
  }) {
    emit(CashierReportFilterState(
      to: to?.toIso8601String(),
      from: from?.toIso8601String(),
      template: template,
      preset: preset ?? template ?? state.preset,
      duration: duration ?? state.duration,
    ));
  }
}
