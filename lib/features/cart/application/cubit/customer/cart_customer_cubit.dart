import 'package:customer_repository/customer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cart/application/cubit/customer/cart_customer_state.dart';

class CartCustomerCubit extends Cubit<CartCustomerState> {
  final CustomerRepository customerRepository = CustomerRepositoryImpl();

  CartCustomerCubit() : super(CartCustomerInitial());

  Future<void> init() async {
    await findAll(FindAllCustomerDto());
  }

  Future<void> findAll(FindAllCustomerDto dto) async {
    try {
      emit(CartCustomerLoadInProgress());
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

      emit(CartCustomerLoadSuccess(customers: initCustomers));
    } catch (e) {
      emit(CartCustomerLoadFailure(e.toString()));
    }
  }
}
