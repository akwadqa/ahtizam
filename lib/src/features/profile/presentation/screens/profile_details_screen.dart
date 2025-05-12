import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:ahtizam/src/utils/image_picker_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import '../../../../shared_widgets/circle_image_widget.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../controllers/profile_controller.dart';
import '../widgets/text_form_fields/profile_email_form_field.dart';
import '../widgets/text_form_fields/profile_name_form_field.dart';
import '../widgets/text_form_fields/profile_phone_form_field.dart';

@RoutePage()
class ProfileDetailsScreen extends ConsumerStatefulWidget {
  const ProfileDetailsScreen({super.key});
  @override
  ConsumerState<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends ConsumerState<ProfileDetailsScreen> {
  Future<void> handleUpload(BuildContext context, WidgetRef ref) async {
    final pickedImage = await showImageSourcePicker(context);
    if (pickedImage != null) {
      ref
          .read(profileControllerProvider.notifier)
          .setPersonalImage(pickedImage);
          setState(() {
            
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(profileControllerProvider.notifier);
    final state=ref.watch(profileControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('profile_details')),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                _buildProfileImage(context, ref),
                50.verticalSpace,
                _buildForm(context, controller),
                const Spacer(),
                state.isLoading?
                FadeCircleLoadingIndicator():
                CustomButtonWidget(
                  text: context.tr('save_changes'),
                  onTap: () async {
                    final success = await controller.updateProfile();
                    if (success) {
                      if (context.mounted) {
                        context.maybePop();
                      }
                      Navigator.pop(context);
                      Future.delayed(Duration(milliseconds: 100));
                      showCustomDialog(
                          context: context,
                          icon: Assets.icons.verifiedCheckIc.svg(
                            height: 50,
                            width: 50,
                          ),
                          title: Text("profile_updated_msg".tr()));
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

  Widget _buildProfileImage(BuildContext context, WidgetRef ref) {
    final pickedImage = ref
        .watch(
          profileControllerProvider.notifier,
        )
        .pickedImage;
    final state =
        ref.watch(profileControllerProvider);
    return GestureDetector(
      onTap: () {
        handleUpload(context, ref);
      },
      child: Stack(
        children: [
          CircleImageWidget(
            height: 225,
            width: 225,
            // imageUrl: personalImage,
            circleWidth: 5,
            child: pickedImage != null
                ? Image.file(pickedImage, fit: BoxFit.fill)
                :state.value?.profileImage!=null? CachedNetworkImage(
                    imageUrl:ServicesUrls.imageUrl+ state.value!.profileImage!,
                    fit: BoxFit.fill,
                    errorWidget: (_, __, ___) {
                      return Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      );
                    },
                  ):Icon(
                Icons.person,
                color: Colors.white,
                size: 50,
              ),
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
      ),
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
