import 'package:equatable/equatable.dart';

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
  @override
  List<Object?> get props => [];
}

final class ReportMasterLoadFailure extends ReportMasterState {
  final String error;

  ReportMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
