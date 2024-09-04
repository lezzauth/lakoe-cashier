import 'package:customer_repository/customer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_state.dart';

class CartCustomerCubit extends Cubit<CartCustomerState> {
  final CustomerRepository customerRepository = CustomerRepositoryImpl();

  CartCustomerCubit() : super(CartCustomerInitial());

  Future<void> init(String ownerId) async {
    await findAll(FindAllCustomerDto(ownerId: ownerId));
  }

  Future<void> findAll(FindAllCustomerDto dto) async {
    try {
      emit(CartCustomerLoadInProgress());
      List<CustomerModel> initCustomers = [
        const CustomerModel(
            id: "-", name: "Umum", email: "", phoneNumber: "-", address: ""),
      ];
      final customers = await customerRepository.findAll(dto);
      initCustomers.addAll(customers);
      emit(CartCustomerLoadSuccess(customers: initCustomers));
    } catch (e) {
      emit(CartCustomerLoadFailure(e.toString()));
    }
  }
}
