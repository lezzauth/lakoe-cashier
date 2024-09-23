import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_state.dart';
import 'package:product_repository/product_repository.dart';

class ProductMasterCubit extends Cubit<ProductMasterState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  ProductMasterCubit() : super(ProductMasterInitial());

  Future<void> init(String outletId) async {
    await findAll(FindAllProductDto(outletId: outletId));
  }

  Future<void> findAll(FindAllProductDto dto) async {
    try {
      emit(ProductMasterLoadInProgress());
      final products = await _productRepository.findAll(dto);
      emit(ProductMasterLoadSuccess(products: products));
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      emit(ProductMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create(List<File> images, CreateProductDto dto) async {
    try {
      emit(ProductMasterActionInProgress());
      await _productRepository.create(images, dto);
      emit(ProductMasterActionSuccess());
    } catch (e) {
      ProductActionFailure(e.toString());
    }
  }

  Future<void> update(
    String id, {
    List<File>? images,
    required UpdateProductDto dto,
  }) async {
    try {
      emit(ProductMasterActionInProgress());
      await _productRepository.update(id, dto: dto, images: images);
      emit(ProductMasterActionSuccess());
    } catch (e) {
      ProductActionFailure(e.toString());
    }
  }
}
