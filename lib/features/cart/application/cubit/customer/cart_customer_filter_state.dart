import 'package:equatable/equatable.dart';

class CartCustomerFilterState extends Equatable {
  final String? search;

  const CartCustomerFilterState({this.search});

  @override
  List<Object?> get props => [search];
}
