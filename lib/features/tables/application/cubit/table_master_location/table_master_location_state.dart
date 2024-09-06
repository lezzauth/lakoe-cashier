import 'package:equatable/equatable.dart';
import 'package:table_location_repository/table_location_repository.dart';

sealed class TableMasterLocationState extends Equatable {}

final class TableMasterLocationInitial extends TableMasterLocationState {
  @override
  List<Object?> get props => [];
}

final class TableMasterLocationLoadInProgress extends TableMasterLocationState {
  @override
  List<Object?> get props => [];
}

final class TableMasterLocationLoadSuccess extends TableMasterLocationState {
  final List<TableLocationModel> locations;

  TableMasterLocationLoadSuccess({required this.locations});

  @override
  List<Object?> get props => [locations];
}

final class TableMasterLocationLoadFailure extends TableMasterLocationState {
  final String error;

  TableMasterLocationLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class TableMasterLocationActionInProgress
    extends TableMasterLocationState {
  @override
  List<Object?> get props => [];
}

final class TableMasterLocationActionSuccess extends TableMasterLocationState {
  final TableLocationModel response;

  TableMasterLocationActionSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class TableMasterLocationActionFailure extends TableMasterLocationState {
  final String error;

  TableMasterLocationActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
