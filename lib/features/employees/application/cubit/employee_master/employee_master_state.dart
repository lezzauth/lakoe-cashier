import 'package:dio_provider/dio_provider.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';

sealed class EmployeeMasterState extends Equatable {}

final class EmployeeMasterInitial extends EmployeeMasterState {
  @override
  List<Object?> get props => [];
}

final class EmployeeMasterLoadInProgress extends EmployeeMasterState {
  @override
  List<Object?> get props => [];
}

final class EmployeeMasterLoadSuccess extends EmployeeMasterState {
  final List<EmployeeModel> employees;

  EmployeeMasterLoadSuccess({required this.employees});

  @override
  List<Object?> get props => [employees];
}

final class EmployeeMasterLoadFailure extends EmployeeMasterState {
  final String error;

  EmployeeMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}

final class EmployeeMasterActionInProgress extends EmployeeMasterState {
  @override
  List<Object?> get props => [];
}

final class EmployeeMasterActionSuccess extends EmployeeMasterState {
  final EmployeeModel response;

  EmployeeMasterActionSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class EmployeeMasterActionFailure extends EmployeeMasterState {
  final String error;

  EmployeeMasterActionFailure(this.error);

  @override
  List<Object?> get props => [];
}

final class EmployeeMasterReachesLimit extends EmployeeMasterState {
  final DioExceptionModel res;

  EmployeeMasterReachesLimit(this.res);

  @override
  List<Object?> get props => [res];
}
