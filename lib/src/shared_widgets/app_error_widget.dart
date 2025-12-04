import 'package:ahtizam/src/shared_widgets/custom_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';

import '../../gen/assets.gen.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  const AppErrorWidget({super.key,  this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.imErrorScreen.image(),
          20.verticalSpace,
          Text(
            context.tr("Unkown error occured"),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          16.verticalSpace,
          CustomButtonWidget(text: "retry".tr(), onTap:onRetry, isFiled: true, height: 25, width: 50,backgroundColor: Colors.black,radius: 8,)
        ],
      ),
    );
  }
}
