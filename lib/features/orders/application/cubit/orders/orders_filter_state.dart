import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

class OrdersFilterState extends Equatable {
  final String? type;
  final String? source;
  final String? status;
  final String? search;
  final String? sort;
  final String? template;
  final String? from;
  final String? to;

  const OrdersFilterState({
    this.type,
    this.source,
    this.status,
    this.search,
    this.sort,
    this.template,
    this.from,
    this.to,
  });

  FindAllOrderDto get toFindAllOrderDto => FindAllOrderDto(
        search: search == '' ? null : search,
        sort: sort,
        source: source,
        status: status == 'ALL' ? null : status,
        type: type == 'ALL' ? null : type,
        template: template == 'ALL' ? null : template,
        from: from,
        to: to,
      );

  OrdersFilterState copyWith({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
    String? template,
    String? from,
    String? to,
  }) {
    return OrdersFilterState(
      type: type ?? this.type,
      source: source ?? this.source,
      status: status ?? this.status,
      search: search ?? this.search,
      sort: sort ?? this.sort,
      template: template ?? this.template,
      from: from ?? this.from,
      to: to ?? this.to,
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
        from,
        to,
      ];
}
