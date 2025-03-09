import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:standard_project/gen/assets.gen.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/theme/app_colors.dart';

import '../../../auth/regestration/application/auth_service.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4), // Blurred effect
            // borderRadius: BorderRadius.circular(20),
          ),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Assets.icons.home, "home", 0, context),
              _buildNavItem(Assets.icons.category, "category", 1, context),
              _buildCentralItem(ref),
              _buildNavItem(Assets.icons.messages, "messages", 2, context),
              _buildNavItem(Assets.icons.profile, "profile", 3, context),
            ],
          ).symmetricPadding(
            horizontal: 15,
          ),
        ),
      ),
    ).onlyPadding(bottom: 20.0, start: 20, end: 20);
  }

  Widget _buildNavItem(
      SvgGenImage icon, String title, int index, BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon.svg(
            height: 30,
            width: 30,
            color: selectedIndex == index ? AppColors.primary : AppColors.gray,
          ),
          4.verticalSpace,
          Text(
            context.tr(title),
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _buildCentralItem(WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await ref.read(userDataProvider.notifier).removeData();
        debugPrint(await ref.read(userDataProvider));
      },
      child: Container(
        height: 50,
        width: 50,
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.black,
          shape: BoxShape.rectangle,
        ),
        child: Assets.icons.qr.svg(
          color: Colors.white,
        ),
      ),
    );
  }
}
