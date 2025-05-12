class VerificationCodeParams {
  final String otp;
  final String phone;

  VerificationCodeParams({
    required this.otp,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'otp': otp,
        'mobile_no': phone,
        'action': "passenger",
      };
}
