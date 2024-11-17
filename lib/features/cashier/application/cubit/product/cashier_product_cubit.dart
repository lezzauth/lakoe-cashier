import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:logman/logman.dart';
import 'package:product_repository/product_repository.dart';

class CashierProductCubit extends Cubit<CashierProductState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  CashierProductCubit() : super(CashierProductInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll({
    String? name,
    int? categoryId,
  }) async {
    try {
      emit(CashierProductLoadInProgress());
      final products = await _productRepository.findAll(FindAllProductDto(
        availability: "AVAILABLE",
        name: name,
        categoryId: categoryId,
      ));
      emit(CashierProductLoadSuccess(products: products));
    } catch (e) {
      Logman.instance
          .error("[CashierOrderCubit] Catch findAll(): ${e.toString()}");
      emit(CashierProductLoadFailure(e.toString()));
    }
  }
}
