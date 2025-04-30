abstract class EndPoints {
  static const String homeApi = 'HomepageApi';
 
  //? 🟦 Auth 

  static const String registerApi = 'ehtezam.api.authentication.register';
  static const String loginApi = 'ehtezam.api.authentication.send_otp';
  static const String verificationCodeApi =
      'ehtezam.api.authentication.verify_otp';

  // 🟨 Profile  
    static const String profileDataApi =
      'ehtezam.api.profile.profile';  
}
