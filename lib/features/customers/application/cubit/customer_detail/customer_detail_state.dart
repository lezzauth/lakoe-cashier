import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

sealed class CustomerDetailState extends Equatable {}

final class CustomerDetailInitial extends CustomerDetailState {
  @override
  List<Object?> get props => [];
}

final class CustomerDetailLoadInProgress extends CustomerDetailState {
  @override
  List<Object?> get props => [];
}

final class CustomerDetailLoadSuccess extends CustomerDetailState {
  final DetailCustomerOutletResponse customer;

  CustomerDetailLoadSuccess({required this.customer});

  @override
  List<Object?> get props => [customer];
}

final class CustomerDetailLoadFailure extends CustomerDetailState {
  final String error;

  CustomerDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
