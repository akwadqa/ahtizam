import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 85,
                width: 80,
              ),
              Container(
                height: 75,
                width: 75,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.white : AppColors.lightBlue,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  icon,
                ),
              ),
              if (isSelected)
                PositionedDirectional(
                    end: 0,
                    top: -2,
                    child: Container(
                      color: Colors.white,
                      child: Icon(
                        Icons.check_circle,
                        size: 20,
                        color: AppColors.primary,
                      ).allPadding(6),
                    ))
            ],
          ),
          Text(
            title.tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
