import 'package:equatable/equatable.dart';

class CustomerMasterFilterState extends Equatable {
  final String? search;

  const CustomerMasterFilterState({this.search});

  @override
  List<Object?> get props => [search];
}
