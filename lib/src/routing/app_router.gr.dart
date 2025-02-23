// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:standard_project/src/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:standard_project/src/features/onBoarding/presentations/screens/choose_language_screen.dart'
    as _i1;
import 'package:standard_project/src/features/onBoarding/presentations/screens/on_boarding_screen.dart'
    as _i3;

/// generated route for
/// [_i1.ChooseLanguageScreen]
class ChooseLanguageRoute extends _i4.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i4.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChooseLanguageScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.OnBoardingScreen]
class OnBoardingRoute extends _i4.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i4.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnBoardingScreen();
    },
  );
}
