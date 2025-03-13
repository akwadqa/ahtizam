import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../regestration/data/auth_repository.dart';

part 'verification_code_service.g.dart';

@riverpod
class VerificationCodeService extends _$VerificationCodeService {
  static const int initialCountdown = 35;
  Timer? _timer;

  @override
  int build() {
    startCountdown();
    ref.onDispose(() {
      _timer?.cancel();
    });
    return initialCountdown;
  }

  bool get canResend => state == 0;

  void startCountdown() {
    state = initialCountdown;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> resendOtp(String phone) async {
    if (!canResend) return;
    await AsyncValue.guard(() async {
      await ref.watch(authRepositoryProvider).login(phone);
      state = initialCountdown;
      startCountdown();
    });
  }

  void stopCountdown() {
    _timer?.cancel();
    state = 0; // Ensure countdown is fully reset
  }
}
// final verificationCodeServiceProvider =
//     AutoDisposeNotifierProvider<VerificationCodeService, int>(
//         (ref) => VerificationCodeService());
