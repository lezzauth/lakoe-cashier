import 'package:equatable/equatable.dart';

sealed class OrderEditState extends Equatable {}

final class OrderEditInitial extends OrderEditState {
  @override
  List<Object?> get props => [];
}

final class OrderEditActionInProgress extends OrderEditState {
  @override
  List<Object?> get props => [];
}

final class OrderEditActionSuccess extends OrderEditState {
  @override
  List<Object?> get props => [];
}

final class OrderEditActionFailure extends OrderEditState {
  final String error;

  OrderEditActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
