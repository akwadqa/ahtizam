import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/gen/assets.gen.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/features/app/app.dart';

import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../theme/app_colors.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.grey),
            child: Image.network(
              "https://i.sstatic.net/lj4dt.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Assets.icons.settings.svg(height: 30, width: 30),
                      Assets.icons.logo
                          .svg(
                            fit: BoxFit.scaleDown,
                          )
                          .onlyPadding(top: 5),
                      Icon(Icons.notifications, size: 28),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 150.0, left: 20, right: 20),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        // BoxShadow(color: Colors.black26, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("أهلاً حمد!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        CustomButtonWidget(
                            text: context.tr("اطلب سطحه"),
                            onTap: () {
                              // Navigate to next screen
                              // context.navigateTo(OnBoardingRoute());
                            },
                            backgroundColor: AppColors.black,
                            isFiled: true,
                            height: 55,
                            radius: 15,
                            width: MediaQuery.sizeOf(context).width)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
