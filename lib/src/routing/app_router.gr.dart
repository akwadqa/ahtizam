// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ahtizam/src/features/auth/regestration/presentation/screens/login_screen/login_screen.dart'
    as _i4;
import 'package:ahtizam/src/features/auth/regestration/presentation/screens/signup_screen/signup_screen.dart'
    as _i8;
import 'package:ahtizam/src/features/auth/verification_code/presentation/screen/verification_code_screen.dart'
    as _i9;
import 'package:ahtizam/src/features/home/presentation/screens/home_screen.dart'
    as _i3;
import 'package:ahtizam/src/features/home/presentation/screens/main_screen.dart'
    as _i5;
import 'package:ahtizam/src/features/onBoarding/presentations/screens/choose_language_screen.dart'
    as _i2;
import 'package:ahtizam/src/features/onBoarding/presentations/screens/on_boarding_screen.dart'
    as _i6;
import 'package:ahtizam/src/features/payment/presentation/pages/add_card_page.dart'
    as _i1;
import 'package:ahtizam/src/features/payment/presentation/pages/payment_method_page.dart'
    as _i7;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.AddCardPage]
class AddCardRoute extends _i10.PageRouteInfo<void> {
  const AddCardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCardRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCardPage();
    },
  );
}

/// generated route for
/// [_i2.ChooseLanguageScreen]
class ChooseLanguageRoute extends _i10.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseLanguageScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainScreen();
    },
  );
}

/// generated route for
/// [_i6.OnBoardingScreen]
class OnBoardingRoute extends _i10.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i7.PaymentMethodPage]
class PaymentMethodRoute extends _i10.PageRouteInfo<void> {
  const PaymentMethodRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PaymentMethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethodRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.PaymentMethodPage();
    },
  );
}

/// generated route for
/// [_i8.SignupScreen]
class SignupRoute extends _i10.PageRouteInfo<void> {
  const SignupRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignupScreen();
    },
  );
}

/// generated route for
/// [_i9.VerificationScreen]
class VerificationRoute extends _i10.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i11.Key? key,
    required String inputedPhone,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            inputedPhone: inputedPhone,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i9.VerificationScreen(
        key: args.key,
        inputedPhone: args.inputedPhone,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.inputedPhone,
  });

  final _i11.Key? key;

  final String inputedPhone;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, inputedPhone: $inputedPhone}';
  }
}
