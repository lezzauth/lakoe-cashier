import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_state.dart';

class ReportMasterCubit extends Cubit<ReportMasterState> {
  final OutletRepository _outletRepository = OutletRepositoryImpl();

  ReportMasterCubit() : super(ReportMasterInitial());

  Future<void> init({required String outletId}) async {
    await findAll(
      outletId: outletId,
      dto: const GetOutletReportDto(template: "TODAY"),
    );
  }

  Future<void> findAll({
    required String outletId,
    GetOutletReportDto? dto,
  }) async {
    try {
      emit(ReportMasterLoadInProgress());
      final report = await _outletRepository.getOutletReports(
        outletId: outletId,
        dto: dto,
      );
      emit(ReportMasterLoadSuccess(report: report));
    } catch (e) {
      emit(ReportMasterLoadFailure(e.toString()));
    }
  }
}
