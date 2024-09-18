import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

sealed class ReportMasterState extends Equatable {}

final class ReportMasterInitial extends ReportMasterState {
  @override
  List<Object?> get props => [];
}

final class ReportMasterLoadInProgress extends ReportMasterState {
  @override
  List<Object?> get props => [];
}

final class ReportMasterLoadSuccess extends ReportMasterState {
  final OutletReportModel report;

  ReportMasterLoadSuccess({required this.report});

  @override
  List<Object?> get props => [report];
}

final class ReportMasterLoadFailure extends ReportMasterState {
  final String error;

  ReportMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
