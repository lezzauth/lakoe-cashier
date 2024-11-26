import 'package:equatable/equatable.dart';

class ShopOrderCashierFilterState extends Equatable {
  final String? status;

  const ShopOrderCashierFilterState({this.status});

  @override
  List<Object?> get props => [status];
}
