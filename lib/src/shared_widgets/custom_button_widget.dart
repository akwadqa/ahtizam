import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';

import '../theme/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool isFiled;
  final double height;
  final double width;
  final double? radius;
  final double? topPading;
  final bool isDisabled;
  const CustomButtonWidget({
    super.key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.color,
    required this.onTap,
    required this.isFiled,
    required this.height,
    required this.width,
    this.radius,
    this.topPading,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledForegroundColor: Colors.transparent,
        shadowColor: isDisabled ? Colors.transparent : null,
        overlayColor: isDisabled ? Colors.transparent : null,
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor ?? Colors.transparent,
        foregroundColor: AppColors.black900,
        fixedSize: Size(
          width,
          height,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? backgroundColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 25),
        ),
      ),
      onPressed: onTap,
      child: Text(
        context.tr(text),
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 15,
              color: color ?? (isFiled ? Colors.white : Colors.black),
              fontWeight: FontWeight.w500,
            ),
      ).centered(),
    ).onlyPadding(top: topPading ?? 0);
  }
}
