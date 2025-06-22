abstract class EndPoints {
  static const String homeApi = 'HomepageApi';
 
  //? 🟦 Auth 

  static const String registerApi = 'ehtezam.api.authentication.register';
  static const String loginApi = 'ehtezam.api.authentication.send_otp';
  static const String verificationCodeApi =
      'ehtezam.api.authentication.verify_otp';

  // 🟩 NEW ORDER  
    static const String quickOrderApi =
      'ehtezam.api.quick_order.quick_order';  
    static const String processQuickOrderApi =
      'ehtezam.api.quick_order.process_quick_order';  
      

      
    static const String serviceTypes =
      'ehtezam.api.service_type.service_types';  
 



  // 🟪 ORDER INFO
       static const String orderDetailsApi =
      'ehtezam.api.quick_order.get_quick_order_details';  


  // 🟪 PAYMENT  

  static const String getPaymentUrl = 'sadad.api.api.get_payment_url';
  static const String updatePaymentStatus =
      'sadad.www.payment_form.update_payment';

  // 🟨 Profile  
    static const String profileDataApi =
      'ehtezam.api.profile.profile';  
}
