import 'package:customer_repository/customer_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/utils/helpers/error_handler.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_state.dart';

class CustomerMasterCubit extends Cubit<CustomerMasterState> {
  final CustomerRepository customerRepository = CustomerRepositoryImpl();

  CustomerMasterCubit() : super(CustomerMasterInitial());

  Future<void> init() async {
    await findAll(FindAllCustomerDto());
  }

  Future<void> findAll(FindAllCustomerDto dto) async {
    try {
      emit(CustomerMasterLoadInProgress());

      List<CustomerModel> initCustomers = [];

      if (dto.search == null || dto.search!.isEmpty) {
        initCustomers = [
          const CustomerModel(
            id: "-",
            name: "Tamu",
            email: "",
            phoneNumber: "-",
            address: "",
          ),
        ];
      }

      final customers = await customerRepository.findAll(dto);
      initCustomers.addAll(customers);
      emit(CustomerMasterLoadSuccess(customers: initCustomers));
    } on DioException catch (e) {
      handleDioException<CustomerMasterState>(
        e,
        emit: (state) => emit(state),
        connectionIssueState: ConnectionIssue(
          'Failed to resolve hostname. Please check your DNS or internet connection.',
        ),
        timeoutState: ConnectionIssue('Request timed out. Please try again.'),
        unexpectedState: CustomerMasterLoadFailure(e.toString()),
      );
    } catch (e) {
      emit(CustomerMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create(CustomerDto dto) async {
    try {
      emit(CustomerMasterActionInProgress());
      final res = await customerRepository.create(dto);
      emit(CustomerMasterActionSuccess(res));
    } catch (e) {
      if (e is DioException) {
        final limit = e.error as DioExceptionModel;
        emit(CustomerReachesLimit(limit));
        return;
      }
      emit(CustomerMasterActionFailure(e.toString()));
    }
  }

  Future<void> update(String id, CustomerDto dto) async {
    try {
      emit(CustomerMasterActionInProgress());
      final res = await customerRepository.update(id, dto);
      emit(CustomerMasterActionSuccess(res));
    } catch (e) {
      emit(CustomerMasterActionFailure(e.toString()));
    }
  }
}
