import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_state.dart';
import 'package:product_repository/product_repository.dart';

class ReportProductSalesPaginationCubit
    extends Cubit<ReportProductSalesPaginationState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  ReportProductSalesPaginationCubit()
      : super(ReportProductSalesPaginationInitial());

  Future<void> fetchData({
    required String productId,
    ListOrderByProductDto? dto,
  }) async {
    if (dto?.cursor == null) {
      emit(ReportProductSalesPaginationLoadInProgress());
    }

    try {
      final response = await _productRepository.listOrderByProduct(
        productId,
        ListOrderByProductDto(
            cursor: dto?.cursor, from: dto?.from, to: dto?.to),
      );

      if (state is ReportProductSalesPaginationLoadSuccess) {
        final currentState = state as ReportProductSalesPaginationLoadSuccess;

        emit(
          ReportProductSalesPaginationLoadSuccess(
            data: List.from(currentState.data)..addAll(response.data),
            productId: productId,
            dto: ListOrderByProductDto(
              cursor: response.nextCursor,
              from: currentState.dto?.from,
              to: currentState.dto?.to,
            ),
          ),
        );
      } else {
        emit(ReportProductSalesPaginationLoadSuccess(
          data: response.data,
          productId: productId,
          dto: ListOrderByProductDto(
            cursor: response.nextCursor,
            from: dto?.from,
            to: dto?.to,
          ),
        ));
      }
    } catch (e) {
      emit(ReportProductSalesPaginationLoadFailure(e.toString()));
    }
  }

  void loadMoreItems() {
    if (state is ReportProductSalesPaginationLoadSuccess &&
        state is! ReportProductSalesPaginationLoadMore) {
      final currentState = state as ReportProductSalesPaginationLoadSuccess;

      if (currentState.dto?.cursor != null) {
        emit(ReportProductSalesPaginationLoadMore(
          data: currentState.data,
          productId: currentState.productId,
          dto: currentState.dto,
        ));

        fetchData(
          productId: currentState.productId,
          dto: currentState.dto,
        );
      }
    }
  }

  void reset() {
    emit(ReportProductSalesPaginationInitial());
  }
}
