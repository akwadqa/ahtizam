import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import '../../../../shared_widgets/circle_image_widget.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../controllers/profile_controller.dart';
import '../widgets/text_form_fields/profile_email_form_field.dart';
import '../widgets/text_form_fields/profile_name_form_field.dart';
import '../widgets/text_form_fields/profile_phone_form_field.dart';

@RoutePage()
class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileControllerProvider);
    final controller = ref.read(profileControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "profile"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                _buildProfileImage(),
                50.verticalSpace,
                _buildForm(context, controller),
                const Spacer(),
                CustomButtonWidget(
                  text: 'save'.tr(),
                  onTap: () async {
                    final success = await controller.updateProfile();
                    if (success) {
                      if (context.mounted) {
                        context.maybePop();
                      }
                    }
                  },
                  backgroundColor: AppColors.black,
                  isFiled: true,
                  height: 50,
                  radius: 12,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        CircleImageWidget(
          imageUrl:
              "ttps://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
          height: 225,
          width: 225,
          circleWidth: 5,
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(230, 187, 59, 1),
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
    );
  }

  Widget _buildForm(BuildContext context, ProfileController controller) {
    return Column(
      children: [
        ProfileNameFormField(
          controller: controller.fullNameController,
        ),
        30.verticalSpace,
        ProfileEmailFormField(
          controller: controller.emailController,
        ),
        30.verticalSpace,
        ProfilePhoneFormField(
          controller: controller.phoneController,
        ),
      ],
    );
  }
}
