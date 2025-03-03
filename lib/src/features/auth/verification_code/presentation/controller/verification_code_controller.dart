import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:standard_project/src/features/auth/verification_code/data/verification_code_repository.dart';
import 'package:standard_project/src/routing/app_router.gr.dart';

import '../../../regestration/application/auth_service.dart';

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

  Future<void> verifyOtp(String otp, String phone, BuildContext context) async {
    state = const AsyncLoading();
    final verificationCode = ref.read(verficationRepositoryProvider);

    try {
      final userData = await verificationCode.verificatonCode(otp, phone);

      // ✅ Store ***REMOVED***
      await ref.read(userDataProvider.notifier).setData(userData);

      // ✅ Update state to "Success"
      state = AsyncData("Success");

      // ✅ Navigate to Main Screen
      // context.router.replaceAll([const MainRoute()]);
    } catch (e) {
      // ❌ Handle errors correctly
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}
