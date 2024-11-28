import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

sealed class OwnerState extends Equatable {}

final class OwnerInitial extends OwnerState {
  @override
  List<Object> get props => [];
}

final class OwnerLoadInProgress extends OwnerState {
  @override
  List<Object?> get props => [];
}

final class OwnerLoadSuccess extends OwnerState {
  final OwnerProfileModel owner;

  OwnerLoadSuccess(this.owner);

  @override
  List<Object?> get props => [owner];
}

final class OwnerLoadFailure extends OwnerState {
  final String error;

  OwnerLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class OwnerActionInProgress extends OwnerState {
  @override
  List<Object?> get props => [];
}

final class OwnerActionSuccess extends OwnerState {
  final UpdateOwnerModel owner;
  OwnerActionSuccess(this.owner);

  @override
  List<Object?> get props => [owner];
}

final class OwnerActionFailure extends OwnerState {
  final String error;

  OwnerActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
