import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

sealed class PurchaseHistoryState extends Equatable {}

final class PurchaseHistoryInitial extends PurchaseHistoryState {
  @override
  List<Object?> get props => [];
}

final class PurchaseHistoryLoadInProgress extends PurchaseHistoryState {
  @override
  List<Object?> get props => [];
}

final class PurchaseHistoryLoadSuccess extends PurchaseHistoryState {
  final List<HistoryPurchaseModel> purchases;

  PurchaseHistoryLoadSuccess({required this.purchases});

  @override
  List<Object?> get props => [purchases];
}

final class PurchaseHistoryLoadFailure extends PurchaseHistoryState {
  final String error;

  PurchaseHistoryLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
