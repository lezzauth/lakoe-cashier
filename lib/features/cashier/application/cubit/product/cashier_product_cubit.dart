import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:product_repository/product_repository.dart';

class CashierProductCubit extends Cubit<CashierProductState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  CashierProductCubit() : super(CashierProductInitial());

  Future<void> init(String outletId) async {
    await findAll(outletId: outletId);
  }

  Future<void> findAll({
    required String outletId,
    String? name,
    int? categoryId,
  }) async {
    try {
      emit(CashierProductLoadInProgress());
      final products = await _productRepository.findAll(FindAllProductDto(
        outletId: outletId,
        availability: "AVAILABLE",
        name: name,
        categoryId: categoryId,
      ));
      emit(CashierProductLoadSuccess(products: products));
    } catch (e, stackTrace) {
      log(e.toString(),
          name: "CashierProductCubit.findAll error", stackTrace: stackTrace);
      emit(CashierProductLoadFailure(e.toString()));
    }
  }
}
