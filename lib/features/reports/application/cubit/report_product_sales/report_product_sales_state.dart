import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

sealed class ReportProductSalesState extends Equatable {}

final class ReportProductSalesInitial extends ReportProductSalesState {
  @override
  List<Object?> get props => [];
}

final class ReportProductSalesLoadInProgress extends ReportProductSalesState {
  @override
  List<Object?> get props => [];
}

final class ReportProductSalesLoadSuccess extends ReportProductSalesState {
  final ProductModel product;

  ReportProductSalesLoadSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

final class ReportProductSalesLoadFailure extends ReportProductSalesState {
  final String error;

  ReportProductSalesLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
