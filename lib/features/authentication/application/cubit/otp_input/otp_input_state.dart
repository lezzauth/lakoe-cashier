import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OtpInputState extends Equatable {}

final class OtpInputInitial extends OtpInputState {
  @override
  List<Object?> get props => [];
}

final class OtpInputActionInProgress extends OtpInputState {
  @override
  List<Object?> get props => [];
}

final class OtpInputActionFailure extends OtpInputState {
  final String error;

  OtpInputActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class OtpInputActionLogin extends OtpInputState {
  final VerifyOTPResponse response;

  OtpInputActionLogin({required this.response});

  @override
  List<Object?> get props => [response];
}

final class OtpInputActionRegister extends OtpInputState {
  final VerifyOTPResponse response;

  OtpInputActionRegister({required this.response});

  @override
  List<Object?> get props => [response];
}