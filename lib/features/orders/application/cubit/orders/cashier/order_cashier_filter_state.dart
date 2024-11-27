import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

class OrderCashierFilterState extends Equatable {
  final String? type;
  final String? source;
  final String? status;
  final String? search;
  final String? sort;
  final String? template;
  final String? to;
  final String? from;

  const OrderCashierFilterState({
    this.type,
    this.source,
    this.status,
    this.search,
    this.sort,
    this.template,
    this.to,
    this.from,
  });

  FindAllOrderCashierDto get toFindAllOrderDto => FindAllOrderCashierDto(
        search: search,
        sort: sort,
        source: source,
        status: status,
        type: type,
        template: template,
        to: to,
        from: from,
      );

  OrderCashierFilterState copyWith({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
    String? template,
    String? to,
    String? from,
  }) {
    return OrderCashierFilterState(
      type: type ?? this.type,
      source: source ?? this.source,
      status: status ?? this.status,
      search: search ?? this.search,
      sort: sort ?? this.sort,
      template: template ?? this.template,
      to: to ?? this.to,
      from: from ?? this.from,
    );
  }

  @override
  List<Object?> get props => [
        type,
        source,
        status,
        search,
        sort,
        template,
        to,
        from,
      ];
}
