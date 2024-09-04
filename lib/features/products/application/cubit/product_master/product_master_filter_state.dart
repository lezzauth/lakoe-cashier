import 'package:equatable/equatable.dart';

class ProductMasterFilterState extends Equatable {
  final String? name;
  final int? categoryId;

  const ProductMasterFilterState({this.name, this.categoryId});

  @override
  List<Object?> get props => [name, categoryId];
}
