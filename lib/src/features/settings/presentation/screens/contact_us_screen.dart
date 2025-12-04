import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/settings/presentation/controllers/settings_controller.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared_widgets/custom_appbar.dart';

@RoutePage()
class ContactUsScreen extends ConsumerWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsControllerProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: CustomAppbar(title: context.tr('contact_support')),
        ),
        body: settingsAsync.when(
          data: (data) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  25.verticalSpace,
                  _buildLabelItem(
                    context,
                    Icons.phone,
                    context.tr('phone_number'),
                    data?.contactUs.phone ?? "********",
                    isPhone: true,
                  ),
                  _buildLabelItem(
                    context,
                    Icons.blur_circular_sharp,
                    context.tr('website'),
                    data?.contactUs.website ?? "www.google.com",
                    color: Colors.blue,
                  ),
                  _buildLabelItem(
                    context,
                    Icons.facebook_outlined,
                    context.tr('facebook'),
                    data?.contactUs.socialMedia["facebook"] ??
                        "www.facebook.com",
                    color: Colors.blue,
                  ),
                  _buildLabelItem(
                    context,
                    Icons.camera,
                    context.tr('instagram'),
                    data?.contactUs.socialMedia["instagram"] ??
                        "https://instagram.com/ehtezam",
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => AppErrorWidget(
            onRetry: () => ref.read(settingsControllerProvider.notifier).build(),
          ),
          loading: () => Center(
            child: FadeCircleLoadingIndicator(),
          ),
        ));
  }

  Widget _buildLabelItem(
      BuildContext context, IconData icon, String title, String value,
      {Color? color, bool? isPhone}) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        12.horizontalSpace,
        Text(
          "$title :",
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        12.horizontalSpace,
        Text(
          value,
          textDirection: isPhone != null ? TextDirection.ltr : null,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.black),
        ),
      ],
    ).onlyPadding(bottom: 8);
  }
}
