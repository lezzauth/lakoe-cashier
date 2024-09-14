import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

sealed class ChargeMasterState extends Equatable {}

final class ChargeMasterInitial extends ChargeMasterState {
  @override
  List<Object?> get props => [];
}

final class ChargeMasterLoadInProgress extends ChargeMasterState {
  @override
  List<Object?> get props => [];
}

final class ChargeMasterLoadSuccess extends ChargeMasterState {
  final List<ChargeModel> charges;

  ChargeMasterLoadSuccess({required this.charges});

  @override
  List<Object?> get props => [charges];
}

final class ChargeMasterLoadFailure extends ChargeMasterState {
  final String error;

  ChargeMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ChargeMasterActionInProgress extends ChargeMasterState {
  @override
  List<Object?> get props => [];
}

final class ChargeMasterActionSuccess extends ChargeMasterState {
  ChargeMasterActionSuccess();

  @override
  List<Object?> get props => [];
}

final class ChargeMasterActionFailure extends ChargeMasterState {
  final String error;

  ChargeMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
