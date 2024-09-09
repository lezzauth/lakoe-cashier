import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

sealed class CashierReportState extends Equatable {}

final class CashierReportInitial extends CashierReportState {
  @override
  List<Object?> get props => [];
}

final class CashierReportLoadInProgress extends CashierReportState {
  @override
  List<Object?> get props => [];
}

final class CashierReportLoadSuccess extends CashierReportState {
  final OutletReportModel report;

  CashierReportLoadSuccess({required this.report});

  @override
  List<Object?> get props => [report];
}

final class CashierReportLoadFailure extends CashierReportState {
  final String error;

  CashierReportLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
