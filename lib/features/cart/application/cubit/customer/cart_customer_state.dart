import 'package:customer_repository/customer_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CartCustomerState extends Equatable {}

final class CartCustomerInitial extends CartCustomerState {
  @override
  List<Object?> get props => [];
}

final class CartCustomerLoadInProgress extends CartCustomerState {
  @override
  List<Object?> get props => [];
}

final class CartCustomerLoadSuccess extends CartCustomerState {
  final List<CustomerModel> customers;

  CartCustomerLoadSuccess({
    this.customers = const [
      CustomerModel(
          id: "-", name: "Tamu", email: "", phoneNumber: "-", address: ""),
    ],
  });

  @override
  List<Object?> get props => [customers];
}

final class CartCustomerLoadFailure extends CartCustomerState {
  final String error;

  CartCustomerLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CartCustomerActionInProgress extends CartCustomerState {
  @override
  List<Object?> get props => [];
}

final class CartCustomerActionSuccess extends CartCustomerState {
  @override
  List<Object?> get props => [];
}

final class CartCustomerActionFailure extends CartCustomerState {
  final String error;

  CartCustomerActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
