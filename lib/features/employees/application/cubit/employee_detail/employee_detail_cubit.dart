import 'package:employee_repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_detail/employee_detail_state.dart';

class EmployeeDetailCubit extends Cubit<EmployeeDetailState> {
  final EmployeeRepository _employeeRepository = EmployeeRepositoryImpl();

  EmployeeDetailCubit() : super(EmployeeDetailInitial());

  Future<void> init(String id) async {
    try {
      emit(EmployeeDetailLoadInProgress());
      final employee = await _employeeRepository.findOne(id);
      emit(EmployeeDetailLoadSuccess(employee: employee));
    } catch (e) {
      emit(EmployeeDetailLoadFailure(e.toString()));
    }
  }
}
