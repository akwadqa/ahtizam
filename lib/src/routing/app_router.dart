import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/regestration/application/auth_service.dart';
import 'app_router.gr.dart';

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
        path: "/choose-language",
        initial: isFirstTime,
      ),
      AutoRoute(page: OnBoardingRoute.page, path: "/onboarding"),
      AutoRoute(
        page: LoginRoute.page,
        path: "/login",
        initial: !isFirstTime && isAuthenticated,
      ),
      AutoRoute(page: SignupRoute.page, path: "/signup"),
      AutoRoute(page: VerificationRoute.page, path: "/verify"),
      AutoRoute(
        page: MainRoute.page,
        path: "/main",
        initial: !isFirstTime && !isAuthenticated,
      ),
    ];
  }

  /// **Manually determine the initial route**
  // PageRouteInfo<void>  getInitialRoute() {
  //   final isFirstTime = ref.read(isFirstTimeOpeningAppProvider);
  //   final isAuthenticated = ref.read(isAuthinticatedProvider);

  //   if (isFirstTime) {
  //     return const ChooseLanguageRoute();
  //   } else if (isAuthenticated) {
  //     return const MainRoute();
  //   } else {
  //     return const LoginRoute();
  //   }
  // }

//   @override
//   RouteType get defaultRouteType => const RouteType.material();

//   // ✅ First-time open? → Go to ChooseLanguageRoute
// // ✅ Returning user with token? → Go to MainRoute
// // ✅ Returning user without token? → Go to LoginRoute
  // Future<String?> onNavigation(String? routeName, StackRouter router) async {
  //   final isFirstTime = ref.read(isFirstTimeOpeningAppProvider);
  //   final isAuthenticated = ref.read(isAuthinticatedProvider);

  //   if (isFirstTime) {
  //     return ChooseLanguageRoute.name; // ✅ Ensure this route exists
  //   } else if (isAuthenticated) {
  //     return MainRoute.name; // ✅ Ensure this route exists
  //   } else {
  //     return LoginRoute.name; //
  //   }
  // }
}
