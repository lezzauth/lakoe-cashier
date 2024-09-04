import 'package:customer_repository/customer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final CustomerRepository customerRepository;

  CustomerCubit({required this.customerRepository}) : super(CustomerInitial());

  Future<void> findAll(FindAllCustomerDto dto) async {
    try {
      emit(CustomerLoadInProgress());
      List<CustomerModel> initCustomers = [
        const CustomerModel(
            id: "-", name: "Umum", email: "", phoneNumber: "-", address: ""),
      ];
      final customers = await customerRepository.findAll(dto);
      initCustomers.addAll(customers);
      emit(CustomerLoadSuccess(customers: initCustomers, dto: dto));
    } catch (e) {
      emit(CustomerLoadFailure(e.toString()));
    }
  }

  Future<void> create(CreateCustomerDto dto) async {
    CustomerState currentState = state;
    try {
      emit(CustomerActionInProgress());
      await customerRepository.create(dto);
      emit(CustomerActionSuccess());
    } catch (e) {
      emit(CustomerActionFailure(e.toString()));
    }

    if (currentState is CustomerLoadSuccess) {
      await findAll(currentState.dto);
    }
  }
}
