import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CompletingDataState extends Equatable {}

final class CompletingDataActionInitial extends CompletingDataState {
  @override
  List<Object?> get props => [];
}

final class CompletingDataActionInProgress extends CompletingDataState {
  @override
  List<Object?> get props => [];
}

final class CompletingDataActionSuccess extends CompletingDataState {
  final RegisterResponse response;

  CompletingDataActionSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class CompletingDataActionFailure extends CompletingDataState {
  final String error;

  CompletingDataActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
