import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

class ReportProductSalesPaginationFilterState extends Equatable {
  final String? status;
  final String template;
  final String? from;
  final String? to;

  const ReportProductSalesPaginationFilterState({
    this.status,
    required this.template,
    this.from,
    this.to,
  });

  ListOrderByProductDto get toListOrderByProductDto => ListOrderByProductDto(
        status: status == 'ALL' ? null : status,
        template: ["ALL", "CUSTOM"].contains(template) ? null : template,
        from: from,
        to: to,
      );

  ReportProductSalesPaginationFilterState copyWith({
    String? status,
    String? template,
    String? from,
    String? to,
  }) {
    return ReportProductSalesPaginationFilterState(
      status: status ?? this.status,
      template: template ?? this.template,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object?> get props => [status, template, from, to];
}
