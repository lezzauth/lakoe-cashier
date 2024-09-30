import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_state.dart';

class CustomerDetailCubit extends Cubit<CustomerDetailState> {
  final OutletRepository _outletRepository = OutletRepositoryImpl();

  CustomerDetailCubit() : super(CustomerDetailInitial());

  Future<void> findOne({
    required String customerId,
    DetailCustomerOutletDto? dto,
  }) async {
    try {
      emit(CustomerDetailLoadInProgress());
      final customer = await _outletRepository.detailCustomerOutlet(
        customerId: customerId,
        dto: dto,
      );
      emit(CustomerDetailLoadSuccess(customer: customer));
    } catch (e) {
      emit(CustomerDetailLoadFailure(e.toString()));
    }
  }
}
