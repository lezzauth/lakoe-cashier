import 'package:equatable/equatable.dart';

sealed class OrderAddItemState extends Equatable {}

final class OrderAddItemInitial extends OrderAddItemState {
  @override
  List<Object?> get props => [];
}

final class OrderAddItemActionInProgress extends OrderAddItemState {
  @override
  List<Object?> get props => [];
}

final class OrderAddItemActionSuccess extends OrderAddItemState {
  @override
  List<Object?> get props => [];
}

final class OrderAddItemActionFailure extends OrderAddItemState {
  final String error;

  OrderAddItemActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
