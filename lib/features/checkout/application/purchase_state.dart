import 'package:equatable/equatable.dart';
import 'package:package_repository/package_repository.dart';

sealed class PurchaseState extends Equatable {}

final class PurchaseInitial extends PurchaseState {
  @override
  List<Object?> get props => [];
}

final class PurchaseActionInProgress extends PurchaseState {
  @override
  List<Object?> get props => [];
}

final class PurchaseActionSuccess extends PurchaseState {
  final PurchaseResponseModel response;

  PurchaseActionSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class PurchaseActionFailure extends PurchaseState {
  final String error;

  PurchaseActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
