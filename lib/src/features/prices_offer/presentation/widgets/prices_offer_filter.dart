import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import '../controllers/prices_filter_controller.dart';
import '../controllers/prices_order_data_controller.dart';

class PricesOfferFilter extends ConsumerWidget {
  const PricesOfferFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(pricesFilterControllerProvider);

    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'filter_by'.tr(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
        ),
        // const SizedBox(height: 12),
        8.horizontalSpace,
        Flexible(
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<PriceFilterType>(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.fillGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              ),
              value: selectedFilter,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              items: [
                DropdownMenuItem(
                  value: PriceFilterType.all,
                  child: Text('all_orders'.tr()),
                ),
                DropdownMenuItem(
                  value: PriceFilterType.nearestToMe,
                  child: Text('nearestToMe'.tr()),
                ),
                DropdownMenuItem(
                  value: PriceFilterType.lowestPrice,
                  child: Text('lowestPrice'.tr()),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(pricesFilterControllerProvider.notifier)
                      .changeFilter(value);
                }
              },
            ),
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 12);
  }
}
