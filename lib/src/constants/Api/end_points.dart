abstract class EndPoints {
  static const String homeApi = 'HomepageApi';
 
  //? 🟦 Auth 

  static const String registerApi = 'ehtezam.api.authentication.register';
  static const String loginApi = 'ehtezam.api.authentication.send_otp';
  static const String verificationCodeApi =
      'ehtezam.api.authentication.verify_otp';

  // 🟨 NEW ORDER  
    static const String quickOrderApi =
      'ehtezam.api.quick_order.quick_order';  
      
    static const String quickOrderDetailsApi =
      'ehtezam.api.quick_order.quick_order_details';  
      
    static const String serviceTypes =
      'ehtezam.api.service_type.service_types';  



  // 🟨 Profile  
    static const String profileDataApi =
      'ehtezam.api.profile.profile';  
}
