import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_model.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import '../../../../shared_widgets/app_dialogs.dart';
import '../../../../shared_widgets/circle_image_widget.dart';
import '../controllers/profile_controller.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProfileData = ref.watch(profileControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.halfWhite,
    
      body:
      asyncProfileData.when(data: (data) {
        return  SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              context.tr('profile'),
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
            _buildProfileHeader(context,data),
            30.verticalSpace,
            _buildMenuItems(context),
          ],
        ),
      );
      },
      loading: () => FadeCircleLoadingIndicator().centered(),
      error: (error, stackTrace) => AppErrorWidget(),
      ),
      
       );
  }

  Widget _buildProfileHeader(BuildContext context,ProfileModel data) {
    return GestureDetector(
      onTap: () => context.pushRoute(ProfileDetailsRoute()),
      child: Stack(
        children: [
          CircleImageWidget(
            imageUrl: data.profileImage!=null? ServicesUrls.imageUrl + data.profileImage!:null,
                // "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
            height: 225,
            width: 225,
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
            context.tr('personal_info'),
            onTap: () {
              context.pushRoute(ProfileDetailsRoute());
            },
          ),
          _buildMenuItem(
            context,
            context.tr('wallet'),
            onTap: () {
              context.pushRoute(WalletRoute());
            },
          ),
          _buildMenuItem(
            context,
            context.tr('recommended_questions'),
            onTap: () {
              context.pushRoute(RecomendedQuestionRoute());
            },
          ),
          _buildMenuItem(
            context,
            context.tr('privacy_policy'),
            onTap: () {
              context.pushRoute(PrivacyPolicyRoute());
            },
          ),
          _buildMenuItem(
            context,
            context.tr('withdraw_requests'),
            onTap: () {
              context.pushRoute(WithdrawRequestsRoute());
            },
          ),
          _buildMenuItem(
            context,
            context.tr('help_center'),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            context.tr('notifications'),
            onTap: () {
              context.pushRoute(NotificationsRoute());
            },
          ),
          _buildMenuItem(
            context,
            context.tr('logout'),
            onTap: () {
              showLogoutDialog(context);
            },
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
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.dark,
                ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          onTap: onTap,
        ),
        const Divider(
          height: 1,
          color: AppColors.lightGray,
          thickness: 1,
        ),
      ],
    );
  }
}
