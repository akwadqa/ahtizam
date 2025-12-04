import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/settings/presentation/controllers/settings_controller.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';                                  
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared_widgets/custom_appbar.dart';

@RoutePage()
class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final settingsAsync = ref.watch(settingsControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('privacy_policy')),
      ),
          body: settingsAsync.when(
          data: (data) {
            return    
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            // Text(
            //   data?.privacyPolicy.title??"",
            //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w600,
            //         color: AppColors.dark,
            //       ),
            // ),
            30.verticalSpace,
            Text(
            data?.privacyPolicy.paragraph??"",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                  ),
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
}
