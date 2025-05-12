import 'dart:ui';

import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopNavigationBar extends ConsumerWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      final currentLanguageNotifier =
                          ref.read(currentLanguageProvider.notifier);

                      currentLanguageNotifier.changeLanguage(
                          context, currentLanguage == 'ar' ? 'en' : 'ar');
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => ChatScreen()));
                    },
                    child: Assets.icons.settings.svg(height: 30, width: 30)),
                Assets.icons.logo
                    .svg(fit: BoxFit.scaleDown)
                    .onlyPadding(top: 5),
                GestureDetector(
                  onTap: () => context.pushRoute(NotificationsRoute()),
                  child: const Icon(Icons.notifications, size: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
