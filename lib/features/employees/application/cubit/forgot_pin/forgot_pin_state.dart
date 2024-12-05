import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';

sealed class ForgotPinState extends Equatable {}

final class ForgotPinInitial extends ForgotPinState {
  @override
  List<Object?> get props => [];
}

final class RequestOtpInProgress extends ForgotPinState {
  @override
  List<Object?> get props => [];
}

final class RequestOtpSuccess extends ForgotPinState {
  final RequestOtpRes res;
  RequestOtpSuccess({required this.res});

  @override
  List<Object?> get props => [];
}

final class RequestOtpFailure extends ForgotPinState {
  final String error;
  RequestOtpFailure(this.error);

  @override
  List<Object?> get props => [];
}

final class VerifyOtpInProgress extends ForgotPinState {
  @override
  List<Object?> get props => [];
}

final class VerifyOtpSuccess extends ForgotPinState {
  final VerifyOtpRes res;
  VerifyOtpSuccess({required this.res});

  @override
  List<Object?> get props => [];
}

final class VerifyOtpFailure extends ForgotPinState {
  final String error;
  VerifyOtpFailure(this.error);

  @override
  List<Object?> get props => [];
}

final class UpdatePinInProgress extends ForgotPinState {
  @override
  List<Object?> get props => [];
}

final class UpdatePinSuccess extends ForgotPinState {
  final EmployeeModel res;
  UpdatePinSuccess({required this.res});

  @override
  List<Object?> get props => [];
}

final class UpdatePinFailure extends ForgotPinState {
  final String error;
  UpdatePinFailure(this.error);

  @override
  List<Object?> get props => [];
}
