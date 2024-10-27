import 'package:dio_provider/dio_provider.dart';
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

final class TokenExpired extends AuthState {
  final DioExceptionModel res;

  TokenExpired(this.res);
}

final class UncompletedProfile extends AuthState {
  final String message;

  UncompletedProfile({required this.message});
}

final class NotFound extends AuthState {
  final DioExceptionModel res;

  NotFound(this.res);
}
