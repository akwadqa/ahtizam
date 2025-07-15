import 'dart:ui';
import 'package:ahtizam/src/core/enums/order_status.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/show_map_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/top_navigation_card.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/change_request_order_state_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/order_details_form/order_details_form.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../theme/app_colors.dart';
import '../../../auth/regestration/application/auth_service.dart';
import '../controllers/location_searching_controller/location_search_controller.dart';
import '../widgets/map/google_map_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime? _lastBackPressed;

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    final backGap = now.difference(_lastBackPressed ?? DateTime(2000));

    if (backGap > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('press_back_again_to_exit'.tr())),
      );
      return false; // Don't pop
    }

    return true; // Exit app
  }

  @override
  Widget build(BuildContext context) {
    final isSecondWidgetVisible =
        ref.watch(changeRequestOrderStateServiceProvider);
    final isThirdWidgetVisible = ref.watch(showOrderFormControllerProvider);
    final hideWidgetsDuringOrder =
        ref.watch(hideLayersDuringOrderControllerProvider);
    final asyncOrder = ref.watch(quickOrderControllerProvider);
    final showSheet =
        asyncOrder is AsyncData && asyncOrder.value?.orderDetails != null;
    final showMap = ref.watch(showMapControllerProvider);
   return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: showMap
          ? Padding(
              padding: EdgeInsetsDirectional.only(end: 15, bottom: 120),
              child: FloatingActionButton(
                backgroundColor: AppColors.primary,
                onPressed: () {
                  ref
                      .read(showMapControllerProvider.notifier)
                      .toggleSelection();
                },
                child: const Icon(Icons.remove_red_eye,
                    color: Colors.white, size: 25),
              ),
            )
          : null,
      // extendBody: true,
      body: Stack(
        children: [
          const _BackgroundMap(),
          const TopNavigationBar(),
          if (!hideWidgetsDuringOrder) ...[
            (isThirdWidgetVisible)
                ? const RequestDetailsForm()
                : isSecondWidgetVisible
                    ? const _RequestOrderBottomActionCard()
                    : const _BottomActionCard(),
            if (isThirdWidgetVisible) _orderButton(context, ref),
          ],
          if (showSheet) ...[
            // SHOW DRIVER SHEET WHEN THE DRIVE ACCEPT THE ORDER AND RECEIVE THE dat in socket

            AnimatedSlide(
              duration: const Duration(seconds: 1),
              offset: showSheet ? Offset(0, 0) : Offset(0, 1),
              curve: Curves.easeOut,
              child:  Align(
                alignment: Alignment.bottomCenter,
                child: DriverDetailsBottomSheet(),
              ),
            ),
          ],
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
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final asyncData = ref.watch(selectServiceTypeControllerProvider);

        if (asyncData is AsyncLoading) {
          return const FadeCircleLoadingIndicator();
        }

        // if (asyncData is AsyncError) {
        //   showErrorDialog(context, "Something wrong");
        // }
        ref.listen(selectServiceTypeControllerProvider, (prev, next) {
          if (next is AsyncLoading) {
            debugPrint("loading🌀");
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FadeCircleLoadingIndicator();
            });
          }
          if (next is AsyncError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Navigator.pop(context); // Close loading dialog if open
              showErrorDialog(context, next.error.toString());
            });
          }
          if (next is AsyncData) {
            final response = next.value;
            debugPrint("data done done ");
          }
        });

        return
            //   serviceTypesState.isLoading
            // ? const Center(
            //     child: SizedBox(
            //       height: 55,
            //       child: FadeCircleLoadingIndicator(),
            //     ),
            //   )
            // :
            CustomButtonWidget(
          text: context.tr("request"),
          onTap: asyncData is AsyncLoading
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref
                        .read(selectServiceTypeControllerProvider.notifier)
                        .getServiceTypesDataInformation(context);
                    // ref
                    //     .read(selectTruckControllerProvider.notifier)
                    //     .getTrucksDataInformation(context);
                  }
                },
          backgroundColor: AppColors.black,
          isFiled: true,
          height: 55,
          radius: 15,
          width: MediaQuery.sizeOf(context).width,
        );
      }),
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
                    // isDisabled: ref.watch(mapControllerProvider.notifier).mapController==null,
                    onTap: () async {
                      ref
                          .read(showOrderFormControllerProvider.notifier)
                          .toggleVisibility();

                      ref
                          .read(showOrderFormControllerProvider.notifier)
                          .intialValueToOrder("request_now");
                      await ref
                          .read(mapControllerProvider.notifier)
                          .updateLocation();
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
