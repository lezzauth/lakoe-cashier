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

final class TableMasterLocationFailure extends TableMasterLocationState {
  final String error;

  TableMasterLocationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
