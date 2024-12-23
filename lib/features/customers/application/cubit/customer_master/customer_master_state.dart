import 'package:customer_repository/customer_repository.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:equatable/equatable.dart';

sealed class CustomerMasterState extends Equatable {}

final class CustomerMasterInitial extends CustomerMasterState {
  @override
  List<Object?> get props => [];
}

final class CustomerMasterLoadInProgress extends CustomerMasterState {
  @override
  List<Object?> get props => [];
}

final class CustomerMasterLoadSuccess extends CustomerMasterState {
  final List<CustomerModel> customers;

  CustomerMasterLoadSuccess({
    this.customers = const [
      CustomerModel(
        id: "-",
        name: "Umum",
        email: "",
        phoneNumber: "-",
        address: "",
      ),
    ],
  });

  @override
  List<Object?> get props => [customers];
}

final class CustomerMasterLoadFailure extends CustomerMasterState {
  final String error;

  CustomerMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CustomerMasterActionInProgress extends CustomerMasterState {
  @override
  List<Object?> get props => [];
}

final class CustomerMasterActionSuccess extends CustomerMasterState {
  final CustomerModel data;

  CustomerMasterActionSuccess(this.data);
  @override
  List<Object?> get props => [];
}

final class CustomerMasterActionFailure extends CustomerMasterState {
  final String error;

  CustomerMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CustomerReachesLimit extends CustomerMasterState {
  final DioExceptionModel res;

  CustomerReachesLimit(this.res);

  @override
  List<Object?> get props => [res];
}
