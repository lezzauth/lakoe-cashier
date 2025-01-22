import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_state.dart';
import 'package:product_repository/product_repository.dart';

class ReportProductSalesCubit extends Cubit<ReportProductSalesState> {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  ReportProductSalesCubit() : super(ReportProductSalesInitial());

  Future<void> findOne(String id) async {
    try {
      emit(ReportProductSalesLoadInProgress());
      final product = await _productRepository.findOne(id);
      emit(ReportProductSalesLoadSuccess(product: product));
    } catch (e) {
      emit(ReportProductSalesLoadFailure(e.toString()));
    }
  }
}
