import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_state.dart';

class ReportMasterCubit extends Cubit<ReportMasterState> {
  ReportMasterCubit() : super(ReportMasterInitial());

  Future<void> init() async {
    //
  }

  Future<void> findAll() async {
    //
  }
}
