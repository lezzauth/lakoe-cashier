import 'package:customer_repository/customer_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_state.dart';

class CustomerMasterCubit extends Cubit<CustomerMasterState> {
  final CustomerRepository customerRepository = CustomerRepositoryImpl();

  CustomerMasterCubit() : super(CustomerMasterInitial());

  Future<void> init() async {
    await findAll(FindAllCustomerDto());
  }

  Future<void> findAll(FindAllCustomerDto dto) async {
    try {
      emit(CustomerMasterLoadInProgress());
      List<CustomerModel> initCustomers = [
        const CustomerModel(
            id: "-", name: "Umum", email: "", phoneNumber: "-", address: ""),
      ];
      final customers = await customerRepository.findAll(dto);
      initCustomers.addAll(customers);
      emit(CustomerMasterLoadSuccess(customers: initCustomers));
    } catch (e) {
      emit(CustomerMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create(CreateCustomerDto dto) async {
    try {
      emit(CustomerMasterActionInProgress());
      await customerRepository.create(dto);
      emit(CustomerMasterActionSuccess());
    } catch (e) {
      if (e is DioException) {
        final limit = e.error as DioExceptionModel;
        emit(CustomerReachesLimit(limit));
        return;
      }
      emit(CustomerMasterActionFailure(e.toString()));
    }
  }
}
