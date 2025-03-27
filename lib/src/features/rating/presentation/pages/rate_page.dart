import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../shared_widgets/fade_circle_loading_indicator.dart';
import '../../../../theme/app_colors.dart';
import '../controllers/rate_controller.dart';
import '../widgets/rating_option_item.dart';

@RoutePage()
class RatePage extends ConsumerWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rateState = ref.watch(rateControllerProvider);
    final rateController = ref.read(rateControllerProvider.notifier);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "التقييم"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'كيف كانت الخدمة',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            ...RatingOption.values.map((option) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RatingOptionItem(
                    option: option,
                    isSelected: rateState.selectedRating == option,
                    onTap: () => rateController.selectRating(option),
                  ),
                )),
            const SizedBox(height: 24),
            Text(
              'أخرى',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'اكتب تعليقك هنا...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              onChanged: rateController.updateComment,
            ),
            if (rateState.error != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[700]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        rateState.error!,
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: rateController.clearError,
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: rateState.isLoading
                  ? const FadeCircleLoadingIndicator()
                  : CustomButtonWidget(
                      text: "تقييم",
                      onTap: rateState.isLoading
                          ? null
                          : () async {
                              final success =
                                  await rateController.submitRating();
                              if (success && context.mounted) {
                                context.maybePop();
                              }
                            },
                      backgroundColor: AppColors.black,
                      isFiled: true,
                      height: 52,
                      width: double.infinity,
                      radius: 12,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
