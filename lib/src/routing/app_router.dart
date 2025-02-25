import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: ChooseLanguageRoute.page,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
        ),
        AutoRoute(page: HomeRoute.page, children: []),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignupRoute.page,
        ),
      ];
}
