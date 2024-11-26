import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

class OrderCashierFilterState extends Equatable {
  final String? type;
  final String? source;
  final String? status;
  final String? search;
  final String? sort;
  final String? rangeType;
  final String? startDate;
  final String? endDate;

  const OrderCashierFilterState({
    this.type,
    this.source,
    this.status,
    this.search,
    this.sort,
    this.rangeType,
    this.startDate,
    this.endDate,
  });

  FindAllOrderCashierDto get toFindAllOrderDto => FindAllOrderCashierDto(
        search: search,
        sort: sort,
        source: source,
        status: status,
        type: type,
        rangeType: rangeType,
        startDate: startDate,
        endDate: endDate,
      );

  OrderCashierFilterState copyWith({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
    String? rangeType,
    String? startDate,
    String? endDate,
  }) {
    return OrderCashierFilterState(
      type: type ?? this.type,
      source: source ?? this.source,
      status: status ?? this.status,
      search: search ?? this.search,
      sort: sort ?? this.sort,
      rangeType: rangeType ?? this.rangeType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props => [
        type,
        source,
        status,
        search,
        sort,
        rangeType,
        startDate,
        endDate,
      ];
}
