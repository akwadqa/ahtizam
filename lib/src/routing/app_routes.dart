// lib/routing/app_routes.dart

class AppRoutes {
  // 🟦 Auth & Onboarding
  static const chooseLanguage = '/choose-language';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const verify = '/verify';

  // 🟩 Main/Home
  static const main = '/main';
  static const home = '/home';

  // 🟨 Profile & Settings
  static const profileDetails = '/profile-details';
  static const wallet = '/wallet';
  static const recommendedQuestions = '/questions';
  static const privacyPolicy = '/privacy-policy';
  static const withdrawRequests = '/withdraw-requests';
  static const notifications = '/notifications';

  // 🟪 Payment
  static const payment = '/payment';
  static const addCard = '/add-card';

  // Others
  static const pricesOffer = '/prices-offer';
  static const rate = '/rate';
}
