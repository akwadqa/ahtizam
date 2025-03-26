import 'package:ahtizam/src/shared_widgets/custom_button_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentBottomSection extends StatelessWidget {
  final double totalAmount;
  final String? selectedMethod;
  final VoidCallback onPay;

  const PaymentBottomSection({
    super.key,
    required this.totalAmount,
    required this.selectedMethod,
    required this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.lightBlue,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'final_cost'.tr(),
                    style: textTheme.titleLarge!.copyWith(
                        // fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black900,
                        letterSpacing: 0.5),
                  ),
                  Text(
                    '${totalAmount.toStringAsFixed(2)} ${'currency'.tr()}',
                    style: textTheme.titleLarge!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              CustomButtonWidget(
                text: 'complete_order'.tr(),
                onTap: onPay,
                backgroundColor:
                    selectedMethod != null ? AppColors.black : AppColors.gray,
                isFiled: true,
                isDisabled: selectedMethod == null,
                height: 52,
                radius: 12,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
