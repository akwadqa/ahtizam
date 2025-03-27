import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/gen/assets.gen.dart';

// @RoutePage()
class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.checkDoneImage.image(),
          75.verticalSpace,
          Text(
            context.tr("success_payment"),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
