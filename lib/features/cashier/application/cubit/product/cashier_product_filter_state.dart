import 'package:equatable/equatable.dart';

class CashierProductFilterState extends Equatable {
  final String? name;
  final int? categoryId;

  const CashierProductFilterState({this.name, this.categoryId});

  @override
  List<Object?> get props => [name, categoryId];
}
