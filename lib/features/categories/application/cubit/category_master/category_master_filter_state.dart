import 'package:equatable/equatable.dart';

class CategoryMasterFilterState extends Equatable {
  final String? search;

  const CategoryMasterFilterState({this.search});

  @override
  List<Object?> get props => [search];
}
