import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/regestration/application/auth_service.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            initial: true,
            page: ChooseLanguageRoute.page,
            path: "/choose-language"),
        AutoRoute(page: OnBoardingRoute.page, path: "/onboarding"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: SignupRoute.page, path: "/signup"),
        AutoRoute(page: VerificationRoute.page, path: "/verify"),
        AutoRoute(page: MainRoute.page, path: "/main"),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();

  // ✅ First-time open? → Go to ChooseLanguageRoute
// ✅ Returning user with token? → Go to MainRoute
// ✅ Returning user without token? → Go to LoginRoute
  Future<String?> onNavigate(String? routeName, StackRouter router) async {
    final isFirstTime = ref.read(isFirstTimeOpeningAppProvider);
    final isAuthenticated = ref.read(isAuthinticatedProvider);

    if (isFirstTime) {
      return "/choose-language";
    } else if (isAuthenticated) {
      return "/main";
    } else {
      return "/login";
    }
  }
}
