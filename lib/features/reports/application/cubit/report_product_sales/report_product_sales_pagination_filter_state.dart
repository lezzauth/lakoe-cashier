import 'package:equatable/equatable.dart';

class ReportProductSalesPaginationFilterState extends Equatable {
  final String? from;
  final String? to;

  const ReportProductSalesPaginationFilterState({this.from, this.to});

  @override
  List<Object?> get props => [from, to];
}
