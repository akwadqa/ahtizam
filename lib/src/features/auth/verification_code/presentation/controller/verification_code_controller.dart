import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:standard_project/src/features/auth/verification_code/data/verification_code_repository.dart';
import 'package:standard_project/src/routing/app_router.gr.dart';

import '../../../../../shared_widgets/app_dialogs.dart';
import '../../../regestration/application/auth_service.dart';
import '../../application/verification_code_service.dart';

part 'verification_code_controller.g.dart';

@riverpod
class VerificationCodeController extends _$VerificationCodeController {
  @override
  FutureOr<void> build() {}

  Future<void> verifyOtp(String otp, String phone, BuildContext context) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final verificationCode = ref.read(verficationRepositoryProvider);

      final userData = await verificationCode.verificatonCode(otp, phone);

      await ref.read(userDataProvider.notifier).setData(userData);
      ref.read(verificationCodeServiceProvider.notifier).stopCountdown();

      (err) => AsyncError(err.toString(), StackTrace.current);
    });
    // Future.microtask(() {
    //   _showDialog(context, state);
    // });
  }
}

void _showDialog(context, verificationState) {
  showCustomDialog(
    context: context,
    title: _buildVerificationState(verificationState),
    // icon: Assets.icons.markIcon.svg(),
  );
}

Widget _buildVerificationState(AsyncValue verificationState) {
  return verificationState.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text(
            "خطأ: $error",
            style: const TextStyle(color: Colors.red),
          ),
      data: (result) => const Text(
            "تم التحقق بنجاح",
            style: TextStyle(color: Colors.green),
          ));
}
