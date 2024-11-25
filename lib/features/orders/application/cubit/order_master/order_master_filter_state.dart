import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

class OrderMasterFilterState extends Equatable {
  final String? type;
  final String? source;
  final String? status;
  final String? search;
  final String? sort;

  const OrderMasterFilterState({
    this.type,
    this.source,
    this.status,
    this.search,
    this.sort,
  });

  FindAllOrderCashierDto get toFindAllOrderDto => FindAllOrderCashierDto(
        search: search,
        sort: sort,
        source: source,
        status: status,
        type: type,
      );

  OrderMasterFilterState copyWith({
    String? type,
    String? source,
    String? status,
    String? search,
    String? sort,
  }) {
    return OrderMasterFilterState(
      type: type ?? this.type,
      source: source ?? this.source,
      status: status ?? this.status,
      search: search ?? this.search,
      sort: sort ?? this.sort,
    );
  }

  @override
  List<Object?> get props => [type, source, status, search, sort];
}
