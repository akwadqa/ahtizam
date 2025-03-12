import 'dart:math';
import 'dart:ui';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:standard_project/gen/assets.gen.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/features/home/application/map_service.dart';
import 'package:standard_project/src/theme/app_colors.dart';

class SearchingTruckLoading extends ConsumerWidget {
  const SearchingTruckLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cachedMapScreenshot =
        ref.watch(mapControllerProvider.notifier).cachedMapScreenshot;

    return PopScope(
      // canPop: false, //* enable this when complete page and handle Api`s
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            (cachedMapScreenshot != null)
                ? Image.memory(
                    cachedMapScreenshot,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                :
                // GoogleMapWidget(),
                Container(
                    color: Colors.blueGrey,
                  ),
            // **Darker Overlay for Loading Effect**
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: AvatarGlow(
                    glowColor: AppColors.primary,
                    curve: Curves.ease,
                    animate: true,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    glowCount: 2,
                    child: ClipOval(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          width: min(225, 225) / 2,
                          height: min(225, 225) / 2,
                          color: AppColors.white,
                          child: Assets.icons.truck.svg().allPadding(50)),
                    )),
              ),
            ),

            // **Loading Text**
            const Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "البحث عن سطحة",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
