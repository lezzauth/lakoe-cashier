class ForgotPinArguments {
  final String? phoneNumber;
  final String? pin;
  final String? otp;

  ForgotPinArguments({
    this.phoneNumber,
    this.pin,
    this.otp,
  });

  factory ForgotPinArguments.fromJson(Map<String, dynamic> json) {
    return ForgotPinArguments(
      phoneNumber: json['phoneNumber'] as String,
      pin: json['pin'] as String,
      otp: json['otp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'pin': pin,
      'otp': otp,
    };
  }
}
