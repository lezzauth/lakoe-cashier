import 'package:equatable/equatable.dart';

class CashierReportFilterState extends Equatable {
  final String? from;
  final String? to;
  final String? template;

  const CashierReportFilterState({this.from, this.to, this.template});

  @override
  List<Object?> get props => [from, to, template];
}
