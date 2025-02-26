import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:standard_project/src/routing/app_router.gr.dart';

part 'verification_code_controller.g.dart';

@riverpod
class VerificationCodeController extends _$VerificationCodeController {
  @override
  FutureOr<void> build() {
    startCountdown();
    return initialCountdown;
  }

  final int initialCountdown = 35;
  int _countdown = 35;
  bool _canResend = false;
  Timer? _timer;

  int get countdown => _countdown;
  bool get canResend => _canResend;

  void startCountdown() {
    _countdown = initialCountdown;
    _canResend = false;
    _timer?.cancel();

    state = AsyncData<int>(_countdown);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        state = AsyncData<int>(_countdown);
      } else {
        _canResend = true;
        timer.cancel();
        state = AsyncData<int>(_countdown);
      }
    });
  }

  Future<void> resendOtp(String phone) async {
    if (!_canResend) return;

    // state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));

    startCountdown();
    state = AsyncData<int>(_countdown);
  }

  Future<void> verifyOtp(String otp, BuildContext context) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));

    if (otp == "0000") {
      state = AsyncData("Success");
      context.navigateTo(HomeRoute());
    } else {
      state = AsyncError("Invalid OTP", StackTrace.current);
    }
  }
}
