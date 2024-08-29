import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_state.dart';
import 'package:product_repository/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit({required this.productRepository}) : super(ProductInitial());

  Future<void> findAll(FindAllProductDto dto) async {
    try {
      emit(ProductLoadInProgress());
      final products = await productRepository.findAll(dto);
      emit(ProductLoadSuccess(products, dto));
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      emit(ProductLoadFailure(e.toString()));
    }
  }

  Future<void> create(List<File> images, CreateProductDto dto) async {
    ProductState currentState = state;
    try {
      emit(ProductActionInProgress());
      await productRepository.create(images, dto);
      emit(ProductActionSuccess());
      if (currentState is ProductLoadSuccess) {
        await findAll(FindAllProductDto(outletId: currentState.dto.outletId));
      }
    } catch (e) {
      ProductActionFailure(e.toString());
    }
  }
}
