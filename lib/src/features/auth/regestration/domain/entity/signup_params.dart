class SignupParams {
  final String email;
  final String name;
  final String phone;

  SignupParams({
    required this.email,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'mobile_no': phone,
        'action': "passenger",
      };
}
