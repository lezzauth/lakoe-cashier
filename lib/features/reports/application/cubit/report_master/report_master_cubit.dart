import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_state.dart';

class ReportMasterCubit extends Cubit<ReportMasterState> {
  final OutletRepository _outletRepository = OutletRepositoryImpl();

  ReportMasterCubit() : super(ReportMasterInitial());

  Future<void> init() async {
    await findAll(
      dto: const GetOutletReportDto(template: "TODAY"),
    );
  }

  Future<void> findAll({
    GetOutletReportDto? dto,
  }) async {
    try {
      emit(ReportMasterLoadInProgress());
      final report = await _outletRepository.getOutletReports(
        dto: dto,
      );
      emit(ReportMasterLoadSuccess(report: report));
    } catch (e) {
      emit(ReportMasterLoadFailure(e.toString()));
    }
  }
}
