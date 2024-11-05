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
  final DetailCustomerOutletResponse data;

  CustomerDetailLoadSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class CustomerDetailLoadFailure extends CustomerDetailState {
  final String error;

  CustomerDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
