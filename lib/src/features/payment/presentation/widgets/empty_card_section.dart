import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';

class EmptyCardsSection extends StatelessWidget {
  final VoidCallback onAddCard;

  const EmptyCardsSection({
    super.key,
    required this.onAddCard,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.cardImage.image(width: 200),
                20.verticalSpace,
                Text(
                  'no_cards_added'.tr(),
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                8.verticalSpace,
                Text(
                  'add_card_description'.tr(),
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!.copyWith(color: AppColors.gray),
                ),
                12.verticalSpace,
              ],
            ),
          ),
          10.verticalSpace,
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              fixedSize: Size(
                double.maxFinite,
                50,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.border, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onAddCard,
            icon: const Icon(
              Icons.add,
              size: 22,
            ).centered(),
            label: Text(
              'add_card'.tr(),
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
