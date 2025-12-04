import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/custom_button_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';

import '../../../auth/regestration/application/auth_service.dart';

@RoutePage()
class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: onBoardingItems(context).length,
              itemBuilder: (context, index) {
                return onBoardingItems(context)[index];
              },
            ),
          ),
          _buildNextButton(context),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomButtonWidget(
      text: currentIndex == onBoardingItems(context).length - 1
          ? context.tr("get_started")
          : context.tr("next"),
      onTap: () async {
        if (currentIndex == onBoardingItems(context).length - 1) {
          context.navigateTo(LoginRoute());
          await markAppOpened(ref);
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      backgroundColor: AppColors.black,
      isFiled: true,
      height: 50,
      radius: 15,
      width: MediaQuery.sizeOf(context).width,
    ).onlyPadding(bottom: 20).symmetricPadding(horizontal: 15);
  }
}

List<Widget> onBoardingItems(BuildContext context) => [
      _buildOnboardingPage(
        context,
        image: SizedBox(
      width: double.infinity,
      child: Assets.images.onboarding1Im.image(
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
        title: context.tr("welcome_msg"),
        description: context.tr("welcome_dsc"),
      ),
      _buildOnboardingPage(
        context,
        image: Stack(
          children: [
            Assets.images.onboarding2Im
                .image()
                .centered()
                .onlyPadding(top: 100),
            Positioned(
              bottom: 10,
              child: Assets.images.onboarding2layerIm.image(),
            ),
          ],
        ),
        title: context.tr("seconde_welcome_msg"),
        description: context.tr("seconde_welcome_dsc"),
      ),
    ];

Widget _buildOnboardingPage(
  BuildContext context, {
  required Widget image,
  required String title,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      image,
      30.verticalSpace,
      Text(
        title,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
      ).symmetricPadding(horizontal: 15),
      2.verticalSpace,
      Text(
        description,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 14, color: AppColors.gray),
      ).symmetricPadding(horizontal: 15),
      15.verticalSpace,
    ],
  );
}
