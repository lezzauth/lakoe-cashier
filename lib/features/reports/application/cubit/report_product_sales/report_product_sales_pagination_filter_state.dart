import 'package:equatable/equatable.dart';

class ReportProductSalesPaginationFilterState extends Equatable {
  final String? from;
  final String? to;
  final String template;

  const ReportProductSalesPaginationFilterState({
    this.from,
    this.to,
    required this.template,
  });

  @override
  List<Object?> get props => [from, to, template];
}
