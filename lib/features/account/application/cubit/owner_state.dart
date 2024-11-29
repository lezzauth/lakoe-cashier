import 'package:owner_repository/owner_repository.dart';

sealed class OwnerState {}

final class OwnerInitial extends OwnerState {}

final class OwnerLoadInProgress extends OwnerState {}

final class OwnerLoadSuccess extends OwnerState {
  final OwnerProfileModel owner;

  OwnerLoadSuccess(this.owner);
}

final class OwnerLoadFailure extends OwnerState {
  final String error;

  OwnerLoadFailure(this.error);
}

final class OwnerActionInProgress extends OwnerState {}

final class OwnerActionSuccess extends OwnerState {
  final UpdateOwnerModel owner;
  OwnerActionSuccess(this.owner);
}

final class OwnerActionFailure extends OwnerState {
  final String error;

  OwnerActionFailure(this.error);
}

final class RequestInProgress extends OwnerState {}

final class RequestSuccess extends OwnerState {
  final RequestOTPRes res;
  RequestSuccess(this.res);
}

final class RequestFailure extends OwnerState {
  final String error;

  RequestFailure(this.error);
}
