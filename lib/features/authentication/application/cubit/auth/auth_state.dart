import 'package:owner_repository/owner_repository.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadInProgress extends AuthState {}

final class AuthReady extends AuthState {
  final String outletId;
  final OwnerProfileModel profile;

  AuthReady({required this.outletId, required this.profile});
}

final class AuthNotReady extends AuthState {}
