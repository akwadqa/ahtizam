// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:standard_project/src/features/auth/regestration/presentation/screens/login_screen/login_screen.dart'
    as _i3;
import 'package:standard_project/src/features/auth/regestration/presentation/screens/signup_screen/signup_screen.dart'
    as _i6;
import 'package:standard_project/src/features/auth/verification_code/presentation/screen/verification_code_screen.dart'
    as _i7;
import 'package:standard_project/src/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:standard_project/src/features/home/presentation/screens/main_screen.dart'
    as _i4;
import 'package:standard_project/src/features/onBoarding/presentations/screens/choose_language_screen.dart'
    as _i1;
import 'package:standard_project/src/features/onBoarding/presentations/screens/on_boarding_screen.dart'
    as _i5;

/// generated route for
/// [_i1.ChooseLanguageScreen]
class ChooseLanguageRoute extends _i8.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i8.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChooseLanguageScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i4.MainScreen();
    },
  );
}

/// generated route for
/// [_i5.OnBoardingScreen]
class OnBoardingRoute extends _i8.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i8.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i6.SignupScreen]
class SignupRoute extends _i8.PageRouteInfo<void> {
  const SignupRoute({List<_i8.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignupScreen();
    },
  );
}

/// generated route for
/// [_i7.VerificationScreen]
class VerificationRoute extends _i8.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i9.Key? key,
    required String inputedPhone,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, inputedPhone: inputedPhone),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i7.VerificationScreen(
        key: args.key,
        inputedPhone: args.inputedPhone,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.inputedPhone});

  final _i9.Key? key;

  final String inputedPhone;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, inputedPhone: $inputedPhone}';
  }
}
