import 'dart:async';
import 'package:ahtizam/src/features/auth/regestration/data/repository/auth_repository.dart';
import 'package:ahtizam/src/features/auth/regestration/domain/entity/login_params.dart';
import 'package:ahtizam/src/features/auth/verification_code/domain/model/verification_code_params.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ahtizam/src/features/auth/verification_code/data/repository/verification_code_repository.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import '../../../../../shared_widgets/app_dialogs.dart';
import '../../../regestration/application/auth_service.dart';

part 'verification_code_controller.g.dart';
@riverpod
class VerificationCodeController extends _$VerificationCodeController {
  static const int initialCountdown = 35;
  Timer? _timer;
  int countdown = initialCountdown;
  bool _hasSubmitted = false;

  @override
  FutureOr<void> build() {
    startCountdown();
  }

  bool get canResend => countdown == 0;

  void startCountdown() {
    countdown = initialCountdown;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        countdown--;
        ref.notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
    countdown = 0;
    ref.notifyListeners();
  }

  Future<void> resendOtp(String phone) async {
    if (!canResend) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.login(LoginParams(phone: phone));
      startCountdown();
    });
  }

  Future<void> verifyOtp(String otp, String phone, BuildContext context) async {
    _hasSubmitted = true; // ✅ Mark that user tried to verify

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final verificationCode = ref.read(verificatonCodeRepositoryProvider);
      final userData = await verificationCode.verificatonCode(VerificationCodeParams(otp: otp, phone: phone));

      await ref.read(userDataProvider.notifier).setData(userData.data!.***REMOVED***);
      await ref.read(userDataProvider.notifier).saveUserInfo(userData.data!);
      stopCountdown();
      ref.invalidate(dioProvider);

      (err) => AsyncError(err.toString(), StackTrace.current);

    });
    WidgetsBinding.instance.addPostFrameCallback((_) {

    if (state is AsyncData && _hasSubmitted) {
      
      context.router.replaceAll([const MainRoute()]);
    } else if (state is AsyncError) {
      showErrorDialog(context, (state as AsyncError).error.toString());
    }
    });
  }
}
