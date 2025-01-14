import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

class ReasonsState extends Equatable {
  final List<String> reasons;

  const ReasonsState({required this.reasons});

  @override
  List<Object?> get props => [reasons];
}

sealed class DeleteAccountState {}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountLoadInProgress extends DeleteAccountState {}

final class DeleteAccountLoadSuccess extends DeleteAccountState {
  final DeleteAccountRes data;

  DeleteAccountLoadSuccess(this.data);
}

final class DeleteAccountLoadFailure extends DeleteAccountState {
  final String error;

  DeleteAccountLoadFailure(this.error);
}
