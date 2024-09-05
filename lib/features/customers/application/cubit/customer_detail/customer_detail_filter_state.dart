import 'package:equatable/equatable.dart';

class CustomerDetailFilterState extends Equatable {
  final String? from;
  final String? to;

  const CustomerDetailFilterState({this.from, this.to});

  @override
  List<Object?> get props => [from, to];
}
