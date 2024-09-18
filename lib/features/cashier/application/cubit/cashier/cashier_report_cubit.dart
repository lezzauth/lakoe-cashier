import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_state.dart';

class CashierReportCubit extends Cubit<CashierReportState> {
  final OutletRepository _outletRepository = OutletRepositoryImpl();

  CashierReportCubit() : super(CashierReportInitial());

  Future<void> init(String outletId) async {
    await getReport(
      outletId: outletId,
      dto: const GetOutletSalesDto(template: "TODAY"),
    );
  }

  Future<void> getReport({
    required String outletId,
    GetOutletSalesDto? dto,
  }) async {
    try {
      emit(CashierReportLoadInProgress());
      final report =
          await _outletRepository.getOutletSales(outletId: outletId, dto: dto);
      emit(CashierReportLoadSuccess(report: report));
    } catch (e) {
      emit(CashierReportLoadFailure(e.toString()));
    }
  }
}
