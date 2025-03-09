import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/gen/assets.gen.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../theme/app_colors.dart';
import '../widgets/google_map_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundMap(),
          const _TopNavigationBar(),
          const _BottomActionCard(),
        ],
      ),
    );
  }
}

/// **Google Map Background Container**
class _BackgroundMap extends StatelessWidget {
  const _BackgroundMap();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.lightestGray,
      child: const GoogleMapWidget(),
    );
  }
}

/// **Blurred Top Navigation Bar with Icons**
class _TopNavigationBar extends StatelessWidget {
  const _TopNavigationBar();

  @override
  Widget build(BuildContext context) {
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
                Assets.icons.settings.svg(height: 30, width: 30),
                Assets.icons.logo
                    .svg(fit: BoxFit.scaleDown)
                    .onlyPadding(top: 5),
                const Icon(Icons.notifications, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// **Blurred Bottom Action Card with Button**
class _BottomActionCard extends StatelessWidget {
  const _BottomActionCard();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150.0, left: 20, right: 20),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "أهلاً حمد!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  CustomButtonWidget(
                    text: context.tr("request_truck"),
                    onTap: () {
                      // TODO: Implement navigation
                    },
                    backgroundColor: AppColors.black,
                    isFiled: true,
                    height: 55,
                    radius: 15,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
