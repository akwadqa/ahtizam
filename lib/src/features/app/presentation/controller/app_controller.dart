import 'dart:async';
import 'package:ahtizam/src/features/app/application/app_service.dart';
import 'package:ahtizam/src/features/app/data/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@Riverpod(keepAlive: true)
class AppController extends _$AppController {
  @override
  Future<void>? build() async {
    return;
  }

  Future<void> checkAppVersion() async {
    // state = const AsyncLoading();


    try {
      final appRepository = ref.watch(appRepositoryProvider);

      final result = await appRepository.checkAppVersion();
     await ref.read(appServiceProvider.notifier).checkAppVersion(result.data!);
      // final slom = await ref
      //     .read(serviceTypesControllerProvider.notifier)
      //     .getServiceTypes(context);
      // state = AsyncData(currentState);
      
    } catch (e) {
      debugPrint("❌ Error checkAppVersion: $e");
      state = AsyncError(e, StackTrace.current);
    }
  }


}
