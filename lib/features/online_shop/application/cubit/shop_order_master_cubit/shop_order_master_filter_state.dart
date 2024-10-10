import 'package:equatable/equatable.dart';

class ShopOrderMasterFilterState extends Equatable {
  final String? status;

  const ShopOrderMasterFilterState({this.status});

  @override
  List<Object?> get props => [status];
}
