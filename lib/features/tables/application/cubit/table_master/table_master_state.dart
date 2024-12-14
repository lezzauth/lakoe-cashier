import 'package:dio_provider/dio_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:table_repository/table_repository.dart';

sealed class TableMasterState extends Equatable {}

final class TableMasterInitial extends TableMasterState {
  @override
  List<Object?> get props => [];
}

final class TableMasterLoadInProgress extends TableMasterState {
  @override
  List<Object?> get props => [];
}

final class TableMasterLoadSuccess extends TableMasterState {
  final List<TableModel> tables;

  TableMasterLoadSuccess({required this.tables});

  @override
  List<Object?> get props => [tables];
}

final class TableMasterLoadFailure extends TableMasterState {
  final String error;

  TableMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class TableMasterActionInProgress extends TableMasterState {
  @override
  List<Object?> get props => [];
}

final class TableMasterActionSuccess extends TableMasterState {
  final TableModel data;

  TableMasterActionSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class TableMasterActionFailure extends TableMasterState {
  final String error;

  TableMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class TableMasterReachesLimit extends TableMasterState {
  final DioExceptionModel res;

  TableMasterReachesLimit(this.res);

  @override
  List<Object?> get props => [res];
}

final class ConnectionIssue extends TableMasterState {
  final String message;

  ConnectionIssue(this.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
