import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:standard_project/gen/assets.gen.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/features/onBoarding/presentations/widgets/language_selectable_widget.dart';
import 'package:standard_project/src/localization/current_language.dart';
import 'package:standard_project/src/routing/app_router.gr.dart';
import 'package:standard_project/src/shared_widgets/custom_button_widget.dart';
import 'package:standard_project/src/theme/app_colors.dart';

@RoutePage()
class ChooseLanguageScreen extends ConsumerWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);

    final currentLanguageNotifier = ref.read(currentLanguageProvider.notifier);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Assets.images.logo
                .image(
                  height: 120,
                  width: 120,
                )
                .symmetricPadding(vertical: 80),
            LanguageSelectableWidget(
              currentLanguage: currentLanguage,
              onLanguageChange: (newLanguage) {
                debugPrint('Language changed to: $newLanguage');
                currentLanguageNotifier.changeLanguage(context, newLanguage);
              },
            ).centered(),
            Spacer(),
            CustomButtonWidget(
                    text: context.tr("lets_go"),
                    onTap: () {
                      // Navigate to next screen
                      context.navigateTo(OnBoardingRoute());
                    },
                    backgroundColor: AppColors.black,
                    isFiled: true,
                    height: 50,
                    radius: 15,
                    width: MediaQuery.sizeOf(context).width)
                .onlyPadding(bottom: 20)
          ],
        ).symmetricPadding(horizontal: 20),
      ),
    );
  }
}
