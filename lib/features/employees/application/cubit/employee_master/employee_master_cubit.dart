import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/utils/helpers/error_handler.dart';

class EmployeeMasterCubit extends Cubit<EmployeeMasterState> {
  final EmployeeRepository _employeeRepository = EmployeeRepositoryImpl();

  EmployeeMasterCubit() : super(EmployeeMasterInitial());

  Future<void> init() async {
    await findAll(FindAllEmployeeDto());
  }

  Future<void> findAll(FindAllEmployeeDto dto) async {
    try {
      emit(EmployeeMasterLoadInProgress());
      final employees = await _employeeRepository.findAll(FindAllEmployeeDto(
        outletId: dto.outletId,
      ));
      emit(EmployeeMasterLoadSuccess(employees: employees));
    } on DioException catch (e) {
      handleDioException<EmployeeMasterState>(
        e,
        emit: (state) => emit(state),
        connectionIssueState: ConnectionIssue(
          'Failed to resolve hostname. Please check your DNS or internet connection.',
        ),
        timeoutState: ConnectionIssue('Request timed out. Please try again.'),
        unexpectedState: EmployeeMasterLoadFailure(e.toString()),
      );
    } catch (e) {
      emit(EmployeeMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create(File? profilePicture, CreateEmployeeDto dto) async {
    try {
      emit(EmployeeMasterActionInProgress());
      final response = await _employeeRepository.create(
          profilePicture: profilePicture, dto: dto);
      emit(EmployeeMasterActionSuccess(response: response));
    } catch (e) {
      if (e is DioException) {
        final resError = e.error as DioExceptionModel;
        emit(EmployeeMasterActionError(resError));
        return;
      }
      emit(EmployeeMasterActionFailure(e.toString()));
    }
  }

  Future<void> update(
    String id, {
    File? profilePicture,
    required UpdateEmployeeDto dto,
  }) async {
    try {
      emit(EmployeeMasterActionInProgress());
      final response = await _employeeRepository.update(
        id,
        profilePicture: profilePicture,
        dto: dto,
      );
      emit(EmployeeMasterActionSuccess(response: response));
    } catch (e) {
      emit(EmployeeMasterActionFailure(e.toString()));
    }
  }
}
