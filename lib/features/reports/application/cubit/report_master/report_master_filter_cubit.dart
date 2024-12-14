import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_filter_state.dart';

class ReportMasterFilterCubit extends Cubit<ReportMasterFilterState> {
  ReportMasterFilterCubit()
      : super(
          const ReportMasterFilterState(preset: "TODAY", template: "TODAY"),
        );

  void setFilter({
    DateTime? to,
    DateTime? from,
    String? template,
    int? duration,
    String? preset,
  }) {
    emit(ReportMasterFilterState(
      to: to?.toIso8601String(),
      from: from?.toIso8601String(),
      template: template,
      preset: preset ?? template ?? state.preset,
      duration: duration ?? state.duration,
    ));
  }
}
