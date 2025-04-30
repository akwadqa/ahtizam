// lib/routing/app_router.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/regestration/application/auth_service.dart';
import 'app_router.gr.dart';
import 'app_routes.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes {
    final isFirstTime = ref.read(isFirstTimeOpeningAppProvider);
    final isAuthenticated = ref.read(isAuthinticatedProvider);

    return [
      AutoRoute(
        page: ChooseLanguageRoute.page,
        path: AppRoutes.chooseLanguage,
        initial: _isInitialChooseLanguage(isFirstTime),
      ),
      AutoRoute(page: OnBoardingRoute.page, path: AppRoutes.onboarding),
      AutoRoute(
        page: LoginRoute.page,
        path: AppRoutes.login,
        initial: _isInitialLogin(isFirstTime, isAuthenticated),
      ),
      AutoRoute(
        page: MainRoute.page,
        path: AppRoutes.main,
        // initial: true,
        initial: _isInitialMain(isFirstTime, isAuthenticated),
        children: [],
      ),
      AutoRoute(page: SignupRoute.page, path: AppRoutes.signup),
      AutoRoute(page: VerificationRoute.page, path: AppRoutes.verify),
      AutoRoute(page: HomeRoute.page, path: AppRoutes.home),
      AutoRoute(page: NotificationsRoute.page, path: AppRoutes.notifications),
      AutoRoute(page: PaymentMethodRoute.page, path: AppRoutes.payment),
      AutoRoute(page: AddCardRoute.page, path: AppRoutes.addCard),
      AutoRoute(page: PricesOfferRoute.page, path: AppRoutes.pricesOffer),
      AutoRoute(page: RateRoute.page, path: AppRoutes.rate),
      AutoRoute(page: ProfileDetailsRoute.page, path: AppRoutes.profileDetails),
      AutoRoute(page: WalletRoute.page, path: AppRoutes.wallet),
      AutoRoute(page: MyOrderDetailsRoute.page, path: AppRoutes.myOrderDetails),
      
      AutoRoute(
          page: RecomendedQuestionRoute.page,
          path: AppRoutes.recommendedQuestions),
      AutoRoute(page: PrivacyPolicyRoute.page, path: AppRoutes.privacyPolicy),
      AutoRoute(
          page: WithdrawRequestsRoute.page, path: AppRoutes.withdrawRequests),
    ];
  }

  bool _isInitialChooseLanguage(bool isFirstTime) => isFirstTime;

  bool _isInitialLogin(bool isFirstTime, bool isAuthenticated) =>
      !isFirstTime && !isAuthenticated;

  bool _isInitialMain(bool isFirstTime, bool isAuthenticated) =>
      !isFirstTime && isAuthenticated;
}
