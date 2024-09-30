import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/features/home/application/cubit/onboarding_transaction/onboarding_transaction_state.dart';
import 'package:product_repository/product_repository.dart';

class OnboardingTransactionCubit extends Cubit<OnboardingTransactionState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();
  final ProductRepository _productRepository = ProductRepositoryImpl();

  OnboardingTransactionCubit() : super(OnboardingTransactionInitial());

  Future<void> init({required String ownerId, required String outletId}) async {
    try {
      emit(OnboardingTransactionLoadInProgress());
      final accounts = await _ownerRepository.bank.findAll(ownerId: ownerId);
      final products = await _productRepository
          .findAll(FindAllProductDto(outletId: outletId));
      emit(OnboardingTransactionLoadSuccess(
        isBankAccountCompleted: accounts.isNotEmpty,
        isProductCompleted: products.isNotEmpty,
      ));
    } catch (e) {
      emit(OnboardingTransactionLoadFailure(e.toString()));
    }
  }
}
