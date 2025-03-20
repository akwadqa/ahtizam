import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';

import '../../gen/assets.gen.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

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
        ],
      ),
    );
  }
}
