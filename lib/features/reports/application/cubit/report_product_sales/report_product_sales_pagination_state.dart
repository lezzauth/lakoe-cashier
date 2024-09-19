import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

sealed class ReportProductSalesPaginationState extends Equatable {}

final class ReportProductSalesPaginationInitial
    extends ReportProductSalesPaginationState {
  @override
  List<Object?> get props => [];
}

final class ReportProductSalesPaginationLoadInProgress
    extends ReportProductSalesPaginationState {
  @override
  List<Object?> get props => [];
}

final class ReportProductSalesPaginationLoadSuccess
    extends ReportProductSalesPaginationState {
  final List<ProductOrderModel> data;
  final ListOrderByProductDto? dto;
  final String productId;

  ReportProductSalesPaginationLoadSuccess({
    required this.data,
    required this.productId,
    this.dto,
  });

  @override
  List<Object?> get props => [data, dto, productId];
}

final class ReportProductSalesPaginationLoadFailure
    extends ReportProductSalesPaginationState {
  final String error;

  ReportProductSalesPaginationLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ReportProductSalesPaginationLoadMore
    extends ReportProductSalesPaginationLoadSuccess {
  ReportProductSalesPaginationLoadMore({
    required super.data,
    required super.productId,
    super.dto,
  });
}
