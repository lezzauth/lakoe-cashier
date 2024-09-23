import 'package:employee_repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_master/employee_master_state.dart';

class EmployeeMasterCubit extends Cubit<EmployeeMasterState> {
  final EmployeeRepository _employeeRepository = EmployeeRepositoryImpl();

  EmployeeMasterCubit() : super(EmployeeMasterInitial());

  Future<void> init(String outletId) async {
    await findAll(FindAllEmployeeDto(outletId: outletId));
  }

  Future<void> findAll(FindAllEmployeeDto dto) async {
    try {
      emit(EmployeeMasterLoadInProgress());
      final employees = await _employeeRepository.findAll(FindAllEmployeeDto(
        outletId: dto.outletId,
      ));
      emit(EmployeeMasterLoadSuccess(employees: employees));
    } catch (e) {
      emit(EmployeeMasterLoadFailure(e.toString()));
    }
  }
}
