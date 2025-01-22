class ForgotPinArguments {
  final String id;
  final String? phoneNumber;
  final String? pin;
  final String? otp;
  final String? token;

  ForgotPinArguments({
    required this.id,
    this.phoneNumber,
    this.pin,
    this.otp,
    this.token,
  });

  factory ForgotPinArguments.fromJson(Map<String, dynamic> json) {
    return ForgotPinArguments(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pin: json['pin'] as String,
      otp: json['otp'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'pin': pin,
      'otp': otp,
      'token': token,
    };
  }
}
