import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

sealed class TaxMasterState extends Equatable {}

final class TaxMasterInitial extends TaxMasterState {
  @override
  List<Object?> get props => [];
}

final class TaxMasterLoadInProgress extends TaxMasterState {
  @override
  List<Object?> get props => [];
}

final class TaxMasterLoadSuccess extends TaxMasterState {
  final List<TaxModel> taxes;

  TaxMasterLoadSuccess({required this.taxes});

  @override
  List<Object?> get props => [taxes];
}

final class TaxMasterLoadFailure extends TaxMasterState {
  final String error;

  TaxMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class TaxMasterActionInProgress extends TaxMasterState {
  @override
  List<Object?> get props => [];
}

final class TaxMasterActionSuccess extends TaxMasterState {
  TaxMasterActionSuccess();

  @override
  List<Object?> get props => [];
}

final class TaxMasterActionFailure extends TaxMasterState {
  final String error;

  TaxMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
