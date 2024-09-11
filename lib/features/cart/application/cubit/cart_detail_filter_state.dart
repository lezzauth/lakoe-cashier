import 'package:customer_repository/customer_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:table_repository/table_repository.dart';

class CartDetailFilterState extends Equatable {
  final String type;
  final CustomerModel? customer;
  final TableModel? table;

  const CartDetailFilterState(
      {this.type = "DINEIN", this.customer, this.table});

  @override
  List<Object?> get props => [type, customer, table];
}
