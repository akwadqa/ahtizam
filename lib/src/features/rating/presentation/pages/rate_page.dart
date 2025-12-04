import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

    ref.listen<RateState>(
      rateControllerProvider,
      (prev, next) {
        // Show loading dialog
        if (next.isLoading ) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
           Center(child: FadeCircleLoadingIndicator());
            // showDialog(
            //   context: context,
            //   barrierDismissible: false,
            //   builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
            // );
          // });
        }

        // Handle error state
        if (next.isError && next.message != null && next.message!.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            // Navigator.of(context, rootNavigator: true)
            //     .maybePop(); // Close loading
// Navigator.pop(context);
            await showAutoClosingDialog(
              context,
              next.message!,
            );
            rateController.clearError();
          });
        }

        // Handle success state
        if (next.success && next.message != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Navigator.of(context, rootNavigator: true)
            //     .maybePop(); // Close loading
            Fluttertoast.showToast(
              msg: next.message!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          });
        }
      },
    );
    return PopScope(
            canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
           ref.read(mapControllerProvider.notifier)
                          ..resetPoints()
                          ..updateLocation();
                        ref
                            .read(quickOrderControllerProvider.notifier)
                            .resetOrderDetails();

                        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: CustomAppbar(title: "rating",),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              75.verticalSpace,
              Text(
                "how_was_service".tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
              ).centered(),
              75.verticalSpace,
              Container(
                  // padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ...RatingOption.values.map((option) => RatingOptionItem(
                            option: option,
                            isSelected: rateState.selectedRating == option,
                            onTap: () => rateController.selectRating(option),
                          )),
                    ],
                  )),
              12.verticalSpace,
              TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  // fillColor: Colors.brown,
                  filled: true,
                  hintText: "other".tr(),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontSize: 14, color: AppColors.grayBorder),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                onChanged: rateController.updateComment,
              ),
              24.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: 
                rateState.isLoading
                    ? const FadeCircleLoadingIndicator()
                    :
                     CustomButtonWidget(
                        text: "rate".tr(),
                        onTap: rateState.isLoading
                            ? null
                            : () async {
                                await rateController.submitRating();
                                // if (success && context.mounted) {
                                //   context.maybePop();
                                // }
                              },
                        backgroundColor: AppColors.black,
                        isFiled: true,
                        isDisabled: rateState.selectedRating == null,
                        height: 52,
                        width: double.infinity,
                        radius: 12,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
