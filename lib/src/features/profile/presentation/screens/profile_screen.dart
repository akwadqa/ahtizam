import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import '../../../../shared_widgets/circle_image_widget.dart';
import '../controllers/profile_controller.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.halfWhite,
      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              'my_profile'.tr(),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black800),
            ),
            20.verticalSpace,
            const Divider(
              height: 1,
              color: AppColors.lightGray,
              thickness: 1,
            ),
            20.verticalSpace,
            _buildProfileHeader(context),
            30.verticalSpace,
            _buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(ProfileDetailsRoute()),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          CircleImageWidget(
            imageUrl:
                "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
            height: 175,
            width: 175,
            circleWidth: 5,
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 187, 59, 1),
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildMenuItem(
            context,
            'personal_profile'.tr(),
            onTap: () {
              context.pushRoute(ProfileDetailsRoute());
            },
          ),
          _buildMenuItem(
            context,
            'wallet'.tr(),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            'complaines_list'.tr(),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            'privacy_policy'.tr(),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            'withdraws_requests',
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            'how_could_work_in_ahtezam'.tr(),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            'notifications'.tr(),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            'logOut'.tr(),
            onTap: () {},
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title, {
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          // leading: Icon(icon, color: AppColors.black),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.dark,
                ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          onTap: onTap,
        ),
        // if (showDivider)
        const Divider(
          height: 1,
          color: AppColors.lightGray,
          thickness: 1,
        ),
      ],
    );
  }
}
