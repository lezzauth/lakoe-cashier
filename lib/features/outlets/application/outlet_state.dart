import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

sealed class OutletState extends Equatable {}

final class OutletInitial extends OutletState {
  @override
  List<Object?> get props => [];
}

final class OutletLoadInProgress extends OutletState {
  @override
  List<Object?> get props => [];
}

final class OutletLoadSuccess extends OutletState {
  final OutletModel outlet;

  OutletLoadSuccess({required this.outlet});

  @override
  List<Object?> get props => [outlet];
}

final class OutletLoadFailure extends OutletState {
  final String error;

  OutletLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class OutletActionInProgress extends OutletState {
  @override
  List<Object?> get props => [];
}

final class OutletActionSuccess extends OutletState {
  final OutletModel outlet;

  OutletActionSuccess({required this.outlet});
  @override
  List<Object?> get props => [];
}

final class OutletActionFailure extends OutletState {
  final String error;

  OutletActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
