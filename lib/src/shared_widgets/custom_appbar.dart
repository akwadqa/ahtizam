import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool? withBackButton;
  const CustomAppbar({
    super.key,
    required this.title,
    this.withBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
      // leadingWidth: 65,
      automaticallyImplyLeading: false,
      title: Text(
        context.tr(title),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black800),
      ),
      leading: withBackButton == null ? CustomBackArrowWidget() : null,
      bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(
            height: 1,
            color: AppColors.lightGray,
          )),
    );
  }
}
