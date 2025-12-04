import 'package:ahtizam/src/features/app/presentation/controller/app_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/features/app/presentation/app.dart';
import 'package:device_preview/device_preview.dart';

import 'src/utils/app_initializer.dart';

Future<void> main() async {
  await AppInitializer.init();

  final container = await initializeProviders();
  await handleSplashScreen(container);
  runApp(
    DevicePreview(
      enabled: false,
      // enabled: !kReleaseMode,
      builder: (context) => UncontrolledProviderScope(
        container: container,
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          useOnlyLangCode: true, // Reduces logs and warnings
          path: 'assets/translations',
          child: const App(),
        ),
      ),
    ),
  );
    WidgetsBinding.instance.addPostFrameCallback((_)async {
   await container.read(appControllerProvider.notifier).checkAppVersion();
  });
}
