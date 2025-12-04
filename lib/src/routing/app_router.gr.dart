// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ahtizam/src/features/auth/regestration/presentation/screens/login_screen/login_screen.dart'
    as _i6;
import 'package:ahtizam/src/features/auth/regestration/presentation/screens/signup_screen/signup_screen.dart'
    as _i22;
import 'package:ahtizam/src/features/auth/verification_code/presentation/screen/verification_code_screen.dart'
    as _i23;
import 'package:ahtizam/src/features/home/presentation/screens/home_screen.dart'
    as _i5;
import 'package:ahtizam/src/features/home/presentation/screens/main_screen.dart'
    as _i7;
import 'package:ahtizam/src/features/messages/presentation/screens/chat_screens.dart'
    as _i2;
import 'package:ahtizam/src/features/my_order_details/presentation/screens/my_order_details_screen.dart'
    as _i8;
import 'package:ahtizam/src/features/my_orders/presentation/screens/my_orders.dart'
    as _i11;
import 'package:ahtizam/src/features/my_orders/presentation/screens/past_order_map_screen.dart'
    as _i12;
import 'package:ahtizam/src/features/notifications/presentation/screens/notifications_screen.dart'
    as _i9;
import 'package:ahtizam/src/features/onBoarding/presentations/screens/choose_language_screen.dart'
    as _i3;
import 'package:ahtizam/src/features/onBoarding/presentations/screens/on_boarding_screen.dart'
    as _i10;
import 'package:ahtizam/src/features/payment/presentation/pages/add_card_page.dart'
    as _i1;
import 'package:ahtizam/src/features/payment/presentation/pages/payment_method_page.dart'
    as _i13;
import 'package:ahtizam/src/features/payment/presentation/pages/payment_web_view.dart'
    as _i14;
import 'package:ahtizam/src/features/prices_offer/presentation/screens/prices_offer_screen.dart'
    as _i15;
import 'package:ahtizam/src/features/profile/presentation/screens/profile_details_screen.dart'
    as _i17;
import 'package:ahtizam/src/features/profile/presentation/screens/profile_screen.dart'
    as _i18;
import 'package:ahtizam/src/features/rating/presentation/pages/rate_page.dart'
    as _i19;
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/screens/scan_driver_qr_screen.dart'
    as _i21;
import 'package:ahtizam/src/features/settings/presentation/screens/contact_us_screen.dart'
    as _i4;
import 'package:ahtizam/src/features/settings/presentation/screens/privacy_policy_screen.dart'
    as _i16;
import 'package:ahtizam/src/features/settings/presentation/screens/recomended_question_page.dart'
    as _i20;
import 'package:ahtizam/src/features/transactions_requests/presentation/screens/transactions_requests_screen.dart'
    as _i25;
import 'package:ahtizam/src/features/wallet/presentation/screens/wallet_screen.dart'
    as _i24;
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i28;

/// generated route for
/// [_i1.AddCardPage]
class AddCardRoute extends _i26.PageRouteInfo<void> {
  const AddCardRoute({List<_i26.PageRouteInfo>? children})
    : super(AddCardRoute.name, initialChildren: children);

  static const String name = 'AddCardRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCardPage();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i26.PageRouteInfo<void> {
  const ChatRoute({List<_i26.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.ChooseLanguageScreen]
class ChooseLanguageRoute extends _i26.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i26.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChooseLanguageScreen();
    },
  );
}

/// generated route for
/// [_i4.ContactUsScreen]
class ContactUsRoute extends _i26.PageRouteInfo<void> {
  const ContactUsRoute({List<_i26.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i4.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i26.PageRouteInfo<void> {
  const LoginRoute({List<_i26.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i26.PageRouteInfo<void> {
  const MainRoute({List<_i26.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainScreen();
    },
  );
}

/// generated route for
/// [_i8.MyOrderDetailsScreen]
class MyOrderDetailsRoute extends _i26.PageRouteInfo<MyOrderDetailsRouteArgs> {
  MyOrderDetailsRoute({
    _i27.Key? key,
    required String quickOrderId,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         MyOrderDetailsRoute.name,
         args: MyOrderDetailsRouteArgs(key: key, quickOrderId: quickOrderId),
         initialChildren: children,
       );

  static const String name = 'MyOrderDetailsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyOrderDetailsRouteArgs>();
      return _i8.MyOrderDetailsScreen(
        key: args.key,
        quickOrderId: args.quickOrderId,
      );
    },
  );
}

class MyOrderDetailsRouteArgs {
  const MyOrderDetailsRouteArgs({this.key, required this.quickOrderId});

  final _i27.Key? key;

  final String quickOrderId;

  @override
  String toString() {
    return 'MyOrderDetailsRouteArgs{key: $key, quickOrderId: $quickOrderId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyOrderDetailsRouteArgs) return false;
    return key == other.key && quickOrderId == other.quickOrderId;
  }

  @override
  int get hashCode => key.hashCode ^ quickOrderId.hashCode;
}

/// generated route for
/// [_i9.NotificationsScreen]
class NotificationsRoute extends _i26.PageRouteInfo<void> {
  const NotificationsRoute({List<_i26.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i9.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i10.OnBoardingScreen]
class OnBoardingRoute extends _i26.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i26.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i11.OrdersScreen]
class OrdersRoute extends _i26.PageRouteInfo<void> {
  const OrdersRoute({List<_i26.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i11.OrdersScreen();
    },
  );
}

/// generated route for
/// [_i12.PastOrderMapScreen]
class PastOrderMapRoute extends _i26.PageRouteInfo<PastOrderMapRouteArgs> {
  PastOrderMapRoute({
    _i27.Key? key,
    required _i28.LatLng userLocation,
    required _i28.LatLng destinationLocation,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         PastOrderMapRoute.name,
         args: PastOrderMapRouteArgs(
           key: key,
           userLocation: userLocation,
           destinationLocation: destinationLocation,
         ),
         initialChildren: children,
       );

  static const String name = 'PastOrderMapRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PastOrderMapRouteArgs>();
      return _i12.PastOrderMapScreen(
        key: args.key,
        userLocation: args.userLocation,
        destinationLocation: args.destinationLocation,
      );
    },
  );
}

class PastOrderMapRouteArgs {
  const PastOrderMapRouteArgs({
    this.key,
    required this.userLocation,
    required this.destinationLocation,
  });

  final _i27.Key? key;

  final _i28.LatLng userLocation;

  final _i28.LatLng destinationLocation;

  @override
  String toString() {
    return 'PastOrderMapRouteArgs{key: $key, userLocation: $userLocation, destinationLocation: $destinationLocation}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PastOrderMapRouteArgs) return false;
    return key == other.key &&
        userLocation == other.userLocation &&
        destinationLocation == other.destinationLocation;
  }

  @override
  int get hashCode =>
      key.hashCode ^ userLocation.hashCode ^ destinationLocation.hashCode;
}

/// generated route for
/// [_i13.PaymentMethodPage]
class PaymentMethodRoute extends _i26.PageRouteInfo<void> {
  const PaymentMethodRoute({List<_i26.PageRouteInfo>? children})
    : super(PaymentMethodRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i13.PaymentMethodPage();
    },
  );
}

/// generated route for
/// [_i14.PaymentWebViewPage]
class PaymentWebViewRoute extends _i26.PageRouteInfo<PaymentWebViewRouteArgs> {
  PaymentWebViewRoute({
    _i27.Key? key,
    required String redirectUrl,
    void Function(bool)? onResult,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         PaymentWebViewRoute.name,
         args: PaymentWebViewRouteArgs(
           key: key,
           redirectUrl: redirectUrl,
           onResult: onResult,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentWebViewRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentWebViewRouteArgs>();
      return _i14.PaymentWebViewPage(
        key: args.key,
        redirectUrl: args.redirectUrl,
        onResult: args.onResult,
      );
    },
  );
}

class PaymentWebViewRouteArgs {
  const PaymentWebViewRouteArgs({
    this.key,
    required this.redirectUrl,
    this.onResult,
  });

  final _i27.Key? key;

  final String redirectUrl;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'PaymentWebViewRouteArgs{key: $key, redirectUrl: $redirectUrl, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentWebViewRouteArgs) return false;
    return key == other.key && redirectUrl == other.redirectUrl;
  }

  @override
  int get hashCode => key.hashCode ^ redirectUrl.hashCode;
}

/// generated route for
/// [_i15.PricesOfferScreen]
class PricesOfferRoute extends _i26.PageRouteInfo<void> {
  const PricesOfferRoute({List<_i26.PageRouteInfo>? children})
    : super(PricesOfferRoute.name, initialChildren: children);

  static const String name = 'PricesOfferRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i15.PricesOfferScreen();
    },
  );
}

/// generated route for
/// [_i16.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i26.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i26.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i16.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i17.ProfileDetailsScreen]
class ProfileDetailsRoute extends _i26.PageRouteInfo<void> {
  const ProfileDetailsRoute({List<_i26.PageRouteInfo>? children})
    : super(ProfileDetailsRoute.name, initialChildren: children);

  static const String name = 'ProfileDetailsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i17.ProfileDetailsScreen();
    },
  );
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileRoute extends _i26.PageRouteInfo<void> {
  const ProfileRoute({List<_i26.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i19.RatePage]
class RateRoute extends _i26.PageRouteInfo<void> {
  const RateRoute({List<_i26.PageRouteInfo>? children})
    : super(RateRoute.name, initialChildren: children);

  static const String name = 'RateRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i19.RatePage();
    },
  );
}

/// generated route for
/// [_i20.RecomendedQuestionPage]
class RecomendedQuestionRoute
    extends _i26.PageRouteInfo<RecomendedQuestionRouteArgs> {
  RecomendedQuestionRoute({_i27.Key? key, List<_i26.PageRouteInfo>? children})
    : super(
        RecomendedQuestionRoute.name,
        args: RecomendedQuestionRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'RecomendedQuestionRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecomendedQuestionRouteArgs>(
        orElse: () => const RecomendedQuestionRouteArgs(),
      );
      return _i20.RecomendedQuestionPage(key: args.key);
    },
  );
}

class RecomendedQuestionRouteArgs {
  const RecomendedQuestionRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'RecomendedQuestionRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RecomendedQuestionRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i21.ScanDriverQrPage]
class ScanDriverQrRoute extends _i26.PageRouteInfo<void> {
  const ScanDriverQrRoute({List<_i26.PageRouteInfo>? children})
    : super(ScanDriverQrRoute.name, initialChildren: children);

  static const String name = 'ScanDriverQrRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i21.ScanDriverQrPage();
    },
  );
}

/// generated route for
/// [_i22.SignupScreen]
class SignupRoute extends _i26.PageRouteInfo<void> {
  const SignupRoute({List<_i26.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i22.SignupScreen();
    },
  );
}

/// generated route for
/// [_i23.VerificationScreen]
class VerificationRoute extends _i26.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i27.Key? key,
    required String inputedPhone,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, inputedPhone: inputedPhone),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i23.VerificationScreen(
        key: args.key,
        inputedPhone: args.inputedPhone,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.inputedPhone});

  final _i27.Key? key;

  final String inputedPhone;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, inputedPhone: $inputedPhone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationRouteArgs) return false;
    return key == other.key && inputedPhone == other.inputedPhone;
  }

  @override
  int get hashCode => key.hashCode ^ inputedPhone.hashCode;
}

/// generated route for
/// [_i24.WalletScreen]
class WalletRoute extends _i26.PageRouteInfo<void> {
  const WalletRoute({List<_i26.PageRouteInfo>? children})
    : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i24.WalletScreen();
    },
  );
}

/// generated route for
/// [_i25.WithdrawRequestsScreen]
class WithdrawRequestsRoute extends _i26.PageRouteInfo<void> {
  const WithdrawRequestsRoute({List<_i26.PageRouteInfo>? children})
    : super(WithdrawRequestsRoute.name, initialChildren: children);

  static const String name = 'WithdrawRequestsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i25.WithdrawRequestsScreen();
    },
  );
}
