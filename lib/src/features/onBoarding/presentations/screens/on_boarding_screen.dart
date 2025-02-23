import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:introduction_screen/introduction_screen.dart';
import 'package:standard_project/gen/assets.gen.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';

import 'package:standard_project/src/shared_widgets/custom_button_widget.dart';
import 'package:standard_project/src/theme/app_colors.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
      body: Stack(
        children: [
          Column(
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
                    }),
              ),
              CustomButtonWidget(
                      text: currentIndex == onBoardingItems(context).length - 1
                          ? context.tr("get_started")
                          : context.tr("next"),
                      onTap: () {
                        if (currentIndex ==
                            onBoardingItems(context).length - 1) {}
                        _controller.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      backgroundColor: AppColors.black,
                      isFiled: true,
                      height: 50,
                      radius: 15,
                      width: MediaQuery.sizeOf(context).width)
                  .onlyPadding(bottom: 20)
                  .symmetricPadding(horizontal: 15)
            ],
          ),
          Positioned(
            bottom: 100,
            right: 160,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onBoardingItems(context).length,
                      (index) => buildDots(index))),
            ),
          )
        ],
      ),
    );
  }

  Container buildDots(int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 10 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: currentIndex == index ? AppColors.primary : AppColors.darkGray,
      ),
    );
  }
}

List<Widget> onBoardingItems(BuildContext context) => [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.onboarding1Im.image(),
          30.verticalSpace,
          Text(
            context.tr("welcome_msg"),
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
          ).symmetricPadding(horizontal: 15),
          2.verticalSpace,
          Text(
            context.tr("welcome_dsc"),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14, color: AppColors.gray),
          ).symmetricPadding(horizontal: 15),
          15.verticalSpace,
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Assets.images.onboarding2Im
                    .image()
                    .centered()
                    .onlyPadding(top: 100),
                Container(),
                // Assets.images.onboarding2layerIm.image(),
                Positioned(
                    bottom: 10,
                    // bottom: 100,
                    // right: 160,
                    child: Assets.images.onboarding2layerIm.image()),
              ],
            ),
          ),
          60.verticalSpace,
          Text(
            context.tr("seconde_welcome_msg"),
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
          ).symmetricPadding(horizontal: 15),
          2.verticalSpace,
          Text(
            context.tr("seconde_welcome_dsc"),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14, color: AppColors.gray),
          ).symmetricPadding(horizontal: 15),
          // 15.verticalSpace,
        ],
      ),
    ];
