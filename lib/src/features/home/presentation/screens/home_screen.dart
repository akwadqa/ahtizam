import 'dart:ui';
import 'package:ahtizam/src/features/home/presentation/pages/test_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/change_request_order_state_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/order_details_form/order_details_form.dart';
import '../../../../localization/current_language.dart';
import '../../../../routing/app_router.gr.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../theme/app_colors.dart';
import '../../../auth/regestration/application/auth_service.dart';
import '../controllers/location_searching_controller/location_search_controller.dart';
import '../widgets/map/google_map_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSecondWidgetVisible =
        ref.watch(changeRequestOrderStateServiceProvider);
    final isThirdWidgetVisible = ref.watch(showOrderFormControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBody: true,
      body: Stack(
        children: [
          const _BackgroundMap(),
          const _TopNavigationBar(),
          (isThirdWidgetVisible)
              ? const RequestDetailsForm()
              : isSecondWidgetVisible
                  ? const _RequestOrderBottomActionCard()
                  : const _BottomActionCard(),
          if (isThirdWidgetVisible) _orderButton(context, ref),
        ],
      ),
    );
  }

  Widget _orderButton(BuildContext context, WidgetRef ref) {
    final formKey = ref.read(locationSearchControllerProvider.notifier).formKey;

    return Positioned(
      bottom: 25,
      right: 15,
      left: 15,
      child: CustomButtonWidget(
        text: context.tr("request"),
        onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            ref
                .read(selectTruckControllerProvider.notifier)
                .getTrucksDataInformation(context);
          }
        },
        backgroundColor: AppColors.black,
        isFiled: true,
        height: 55,
        radius: 15,
        width: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}

/// **Google Map Background Container**
class _BackgroundMap extends StatelessWidget {
  const _BackgroundMap();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.lightestGray,
      child: const GoogleMapWidget(),
    );
  }
}

/// **Blurred Top Navigation Bar with Icons**
class _TopNavigationBar extends ConsumerWidget {
  const _TopNavigationBar();

  @override
  Widget build(BuildContext context, ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      // final currentLanguageNotifier =
                      //     ref.read(currentLanguageProvider.notifier);

                      // currentLanguageNotifier.changeLanguage(
                      //     context, currentLanguage == 'ar' ? 'en' : 'ar');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TestPage()));
                    },
                    child: Assets.icons.settings.svg(height: 30, width: 30)),
                Assets.icons.logo
                    .svg(fit: BoxFit.scaleDown)
                    .onlyPadding(top: 5),
                GestureDetector(
                  onTap: () => context.pushRoute(NotificationsRoute()),
                  child: const Icon(Icons.notifications, size: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// **Blurred Bottom Action Card with Button**
class _BottomActionCard extends ConsumerWidget {
  const _BottomActionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userDataProvider.notifier).userinformation;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150.0, left: 20, right: 20),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "welcome".tr(args: [user.fullName]),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  10.verticalSpace,
                  CustomButtonWidget(
                    text: context.tr("request_truck"),
                    onTap: () {
                      ref
                          .read(changeRequestOrderStateServiceProvider.notifier)
                          .toggleWidget();
                    },
                    backgroundColor: AppColors.black,
                    isFiled: true,
                    height: 55,
                    radius: 15,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RequestOrderBottomActionCard extends ConsumerWidget {
  const _RequestOrderBottomActionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150.0, left: 20, right: 20),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButtonWidget(
                    text: context.tr("request_now"),
                    onTap: () {
                      ref
                          .read(showOrderFormControllerProvider.notifier)
                          .toggleVisibility();
                      ref
                          .read(showOrderFormControllerProvider.notifier)
                          .intialValueToOrder("request_now");
                    },
                    backgroundColor: AppColors.black,
                    isFiled: true,
                    height: 55,
                    radius: 15,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  10.verticalSpace,
                  CustomButtonWidget(
                    text: context.tr("request_offer"),
                    onTap: () {
                      ref
                          .read(showOrderFormControllerProvider.notifier)
                          .toggleVisibility();
                      ref
                          .read(showOrderFormControllerProvider.notifier)
                          .intialValueToOrder("request_offer");
                    },
                    // backgroundColor: AppColors.black,
                    isFiled: false,
                    height: 55,
                    radius: 15,
                    borderColor: AppColors.lightestGray,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
