import 'package:customer_repository/customer_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CustomerState extends Equatable {}

final class CustomerInitial extends CustomerState {
  @override
  List<Object?> get props => [];
}

final class CustomerLoadInProgress extends CustomerState {
  @override
  List<Object?> get props => [];
}

final class CustomerLoadSuccess extends CustomerState {
  final List<CustomerModel> customers;
  final FindAllCustomerDto dto;

  CustomerLoadSuccess(
      {this.customers = const [
        CustomerModel(
            id: "-", name: "Umum", email: "", phoneNumber: "-", address: ""),
      ],
      required this.dto});

  @override
  List<Object?> get props => [customers, dto];
}

final class CustomerLoadFailure extends CustomerState {
  final String error;

  CustomerLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CustomerActionInProgress extends CustomerState {
  @override
  List<Object?> get props => [];
}

final class CustomerActionSuccess extends CustomerState {
  @override
  List<Object?> get props => [];
}

final class CustomerActionFailure extends CustomerState {
  final String error;

  CustomerActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
