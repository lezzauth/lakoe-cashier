import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:package_repository/package_repository.dart';

sealed class PurchaseState extends Equatable {}

final class PurchaseInitial extends PurchaseState {
  @override
  List<Object?> get props => [];
}

final class PurchaseLoadInProgress extends PurchaseState {
  @override
  List<Object?> get props => [];
}

final class PurchaseLoadSuccess extends PurchaseState {
  final List<PurchaseModel> purchases;

  PurchaseLoadSuccess({required this.purchases});

  @override
  List<Object?> get props => [purchases];
}

final class PurchaseLoadFailure extends PurchaseState {
  final String error;

  PurchaseLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class PurchaseActionInProgress extends PurchaseState {
  @override
  List<Object?> get props => [];
}

final class PurchaseActionSuccess extends PurchaseState {
  final PurchaseResponseModel res;

  PurchaseActionSuccess({required this.res});

  @override
  List<Object?> get props => [res];
}

final class PurchaseActionFailure extends PurchaseState {
  final String error;

  PurchaseActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class PurchaseDetailInProgress extends PurchaseState {
  @override
  List<Object?> get props => [];
}

final class PurchaseDetailSuccess extends PurchaseState {
  final PurchaseDetail res;

  PurchaseDetailSuccess({required this.res});

  @override
  List<Object?> get props => [res];
}

final class PurchaseDetailFailure extends PurchaseState {
  final String error;

  PurchaseDetailFailure(this.error);

  @override
  List<Object?> get props => [error];
}
