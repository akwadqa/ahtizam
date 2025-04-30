class LoginParams {
  final String phone;

  LoginParams({required this.phone});

  Map<String, dynamic> toJson() => {
        'mobile_no': phone,
        'action': "passenger",
      };
}
