import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as local;

class WithdrawItemWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isOrdered;

  const WithdrawItemWidget(
      {super.key, required this.data, required this.isOrdered});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon inside gray circular box
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.orderIc.svg()),
          const SizedBox(width: 12),

          // Text content
          Expanded(
            child: Row(
              // textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('order_number', args: [data['order']]),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500),
                    ),
                    4.verticalSpace,
                    Text(
                      "${data['date']}\n12/2023",
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 12, color: AppColors.gray),
                    ),
                  ],
                ),
                // Price + status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${context.tr('currency')} ${data['amount']}",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500),
                    ),
                    4.verticalSpace,
                    if (isOrdered)
                      Text(
                        data['status'],
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontSize: 12, color: AppColors.primary),
                      ),
                  ],
                ),

                // Order number + date
              ],
            ).symmetricPadding(horizontal: 10),
          ),
        ],
      ),
    );
  }
}
