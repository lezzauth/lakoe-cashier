import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:lakoe_pos/utils/helpers/error_handler.dart';
import 'package:product_repository/product_repository.dart';

class ProductMasterCubit extends Cubit<ProductMasterState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  ProductMasterCubit() : super(ProductMasterInitial());

  Future<void> init() async {
    await findAll(FindAllProductDto());
  }

  Future<void> findAll(FindAllProductDto dto) async {
    try {
      emit(ProductMasterLoadInProgress());
      final products = await _productRepository.findAll(dto);
      emit(ProductMasterLoadSuccess(products: products));
    } on DioException catch (e) {
      handleDioException<ProductMasterState>(
        e,
        emit: (state) => emit(state),
        connectionIssueState: ConnectionIssue(
          'Failed to resolve hostname. Please check your DNS or internet connection.',
        ),
        timeoutState: ConnectionIssue('Request timed out. Please try again.'),
        unexpectedState: ProductMasterLoadFailure(e.toString()),
      );
    } catch (e) {
      emit(ProductMasterLoadFailure(e.toString()));
    }
  }

  Future<void> findOne(String id) async {
    try {
      emit(ProductMasterActionInProgress());
      await _productRepository.findOne(id);
      emit(ProductMasterActionSuccess());
    } catch (e) {
      ProductMasterActionFailure(e.toString());
    }
  }

  Future<void> create(List<File> images, CreateProductDto dto) async {
    try {
      emit(ProductMasterActionInProgress());
      await _productRepository.create(images, dto);
      emit(ProductMasterActionSuccess());
    } catch (e) {
      if (e is DioException) {
        final limit = e.error as DioExceptionModel;
        emit(ProductMasterReachesLimit(limit));
        return;
      }
      ProductMasterActionFailure(e.toString());
    }
  }

  Future<void> update(
    String id,
    List<File> images,
    UpdateProductDto dto,
  ) async {
    try {
      emit(ProductMasterActionInProgress());
      await _productRepository.update(id, images, dto);
      emit(ProductMasterActionSuccess());
    } catch (e) {
      ProductMasterActionFailure(e.toString());
    }
  }
}
