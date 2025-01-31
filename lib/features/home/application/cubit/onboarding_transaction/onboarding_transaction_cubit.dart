import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/home/application/cubit/onboarding_transaction/onboarding_transaction_state.dart';
import 'package:product_repository/product_repository.dart';

class OnboardingTransactionCubit extends Cubit<OnboardingTransactionState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  OnboardingTransactionCubit() : super(OnboardingTransactionInitial());

  Future<void> init() async {
    try {
      emit(OnboardingTransactionLoadInProgress());
      final products = await _productRepository.findAll(FindAllProductDto());
      emit(OnboardingTransactionLoadSuccess(
        isProductCompleted: products.isNotEmpty,
      ));
    } catch (e) {
      emit(OnboardingTransactionLoadFailure(e.toString()));
    }
  }
}
