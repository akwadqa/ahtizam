import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:introduction_screen/introduction_screen.dart';
import 'package:standard_project/gen/assets.gen.dart';
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
                    itemCount: onBoardingItems.length,
                    itemBuilder: (context, index) {
                      return onBoardingItems[index];
                    }),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 50,
              //   margin: const EdgeInsets.only(
              //     top: 0,
              //     bottom: 40,
              //     left: 20,
              //     right: 20,
              //   ),
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //     ),
              //     onPressed: () {
              //       if (currentIndex == onBoardingItems.length - 1) {}
              //       _controller.nextPage(
              //           duration: Duration(milliseconds: 100),
              //           curve: Curves.bounceIn);
              //       // setState(() {
              //       //   currentIndex++;
              //       //
              //       // });
              //     },
              //     child: Text(
              //       currentIndex == onBoardingItems.length - 1
              //           ? "Get Started"
              //           : 'Next',
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.black),
              //     ),
              //   ),
              // ),
              CustomButtonWidget(
                      text: currentIndex == onBoardingItems.length - 1
                          ? "Get Started"
                          : 'Next',
                      onTap: () {
                        if (currentIndex == onBoardingItems.length - 1) {}
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
            ],
          ).symmetricPadding(horizontal: 15),
          Positioned(
            bottom: 160,
            right: 130,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      onBoardingItems.length, (index) => buildDots(index))),
            ),
          )
        ],
      ),
    );
  }

  Container buildDots(int index) {
    return Container(
      height: 5,
      width: currentIndex == index ? 43 : 32,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: currentIndex == index ? AppColors.darkGray : Color(0xFFEC9E03),
      ),
    );
  }
}

final List<Widget> onBoardingItems = [
  Assets.images.onboarding1Im.image(),
  Column(
    children: [
      Assets.images.onboarding2Im.image(),
      // Assets.images.onboarding2layerIm.image(),
    ],
  ),
];
