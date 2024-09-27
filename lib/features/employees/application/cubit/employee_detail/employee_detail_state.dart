import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';

sealed class EmployeeDetailState extends Equatable {}

final class EmployeeDetailInitial extends EmployeeDetailState {
  @override
  List<Object?> get props => [];
}

final class EmployeeDetailLoadInProgress extends EmployeeDetailState {
  @override
  List<Object?> get props => [];
}

final class EmployeeDetailLoadSuccess extends EmployeeDetailState {
  final EmployeeModel employee;

  EmployeeDetailLoadSuccess({required this.employee});

  @override
  List<Object?> get props => [employee];
}

final class EmployeeDetailLoadFailure extends EmployeeDetailState {
  final String error;

  EmployeeDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
