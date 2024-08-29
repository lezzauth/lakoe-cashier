sealed class AuthState {}

final class AuthInitial extends AuthState {}

// OTP
final class AuthRequestOTPInProgress extends AuthState {}

final class AuthRequestOTPSuccess extends AuthState {
  final String id;
  final String target;
  final String type;
  final String action;

  AuthRequestOTPSuccess({
    required this.id,
    required this.target,
    required this.type,
    required this.action,
  });
}

final class AuthRequestOTPFailure extends AuthState {
  final String error;
  AuthRequestOTPFailure({required this.error});
}

final class AuthRegisterBusinessInformationSuccess extends AuthState {
  final String name;
  final String phoneNumber;
  final String email;
  final String outletAddress;
  final String outletName;
  final String outletType;

  AuthRegisterBusinessInformationSuccess({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.outletAddress,
    required this.outletName,
    required this.outletType,
  });
}

//
final class AuthRegisterInProgress extends AuthState {}

final class AuthRegisterSuccess extends AuthState {
  final String token;

  AuthRegisterSuccess({required this.token});
}

final class AuthRegisterFailure extends AuthState {
  final String error;
  AuthRegisterFailure({required this.error});
}

//
final class AuthVerifyOTPInProgress extends AuthState {}

final class AuthVerifyOTPSuccessAndRegister extends AuthState {
  final String token;
  final String phoneNumber;

  AuthVerifyOTPSuccessAndRegister(
      {required this.token, required this.phoneNumber});
}

final class AuthVerifyOTPSuccessAndLogin extends AuthState {
  final String token;

  AuthVerifyOTPSuccessAndLogin({required this.token});
}

final class AuthVerifyOTPFailure extends AuthState {
  final String error;

  final String target;
  final String action;

  AuthVerifyOTPFailure({
    required this.error,
    required this.target,
    required this.action,
  });
}

final class AuthReady extends AuthState {
  final String token;
  final String outletId;

  AuthReady({required this.token, required this.outletId});
}
