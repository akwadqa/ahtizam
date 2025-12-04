import 'dart:math';
import 'dart:ui';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/theme/app_colors.dart';

import '../features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'searching_truck_loading.g.dart';

class SearchTimerState {
  final int secondsLeft;
  final double progress;
  const SearchTimerState(this.secondsLeft, this.progress);
}

@riverpod
class SearchTimer extends _$SearchTimer {
  static const int totalSeconds = 30;
  Timer? _timer;

  @override
  SearchTimerState build() {
    final initial = const SearchTimerState(totalSeconds, 1.0);

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final next = state.secondsLeft - 1;

      if (next < 0) {
        t.cancel();
        return;
      }

      state = SearchTimerState(
        next,
        next / totalSeconds,
      );
    });

    ref.onDispose(() => _timer?.cancel());
    return initial;
  }
}

class SearchingTruckLoading extends ConsumerWidget {
  const SearchingTruckLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cachedMapScreenshot =
        ref.watch(mapControllerProvider.notifier).cachedMapScreenshot;
    final timer = ref.watch(searchTimerProvider);
  final orderType =
        ref.watch(showOrderFormControllerProvider.notifier).initiallValue;
    final bool isPriceOfferOrder = orderType != "request_now";
    return PopScope(
// canPop: false,     
 child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              (cachedMapScreenshot != null)
                  ? Image.memory(
                      cachedMapScreenshot,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  :
                  // GoogleMapWidget(),
                  Container(
                      color: Colors.blueGrey,
                    ),
              // **Darker Overlay for Loading Effect**
              Container(
                color: AppColors.black.withOpacity(0.3),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(
                  child: AvatarGlow(
                      glowColor: AppColors.primary,
                      curve: Curves.ease,
                      animate: true,
                      duration: Duration(milliseconds: 2000),
                      repeat: true,
                      glowCount: 2,
                      child: ClipOval(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            width: min(225, 225) / 2,
                            height: min(225, 225) / 2,
                            color: AppColors.white.withOpacity(0.5),
                            child: Assets.icons.truck.svg().allPadding(50)),
                      )),
                ),
              ),

              // **Loading Text**
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        context.tr("search_for_truck"),
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      11.verticalSpace,
                      // CustomButtonWidget(
                      //     text: "Retry",
                      //     onTap: () {
                      //       context.pushRoute(PricesOfferRoute());
                      //     },
                      //     isFiled: true,
                      //     backgroundColor: Colors.black,
                      //     radius: 8,
                      //     height: 50,
                      //     width: 220)
                    ],
                  ),
                ),
              ),
           if(isPriceOfferOrder)
           _buildTimerBadge(context, timer)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTimerBadge(BuildContext context, SearchTimerState timer) {

    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            "${timer.secondsLeft}s",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 5),

          // progress bar
          Container(
            width: 280,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 280 * timer.progress,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDBA4A),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
// class SearchingTruckLoading extends ConsumerWidget {
//   const SearchingTruckLoading({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
    // final timer = ref.watch(searchTimerProvider);

//     return Scaffold(
//       body: Stack(
//         children: [
//           // ---- Your Background Code ----
//           Container(color: Colors.blueGrey),
//           Container(color: Colors.black.withOpacity(0.3)),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//             child: _buildTruckGlow(),
//           ),

//           // ---- Your Text ----
//           Positioned(
//             bottom: 80,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Text(
//                 "Searching for Truck...",
//                 style: const TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),

//           // ---- THE NEW TIMER BADGE ----
//           _buildTimerBadge(context, timer),
//         ],
//       ),
//     );
//   }

//   Widget _buildTruckGlow() {
//     return Center(
//       child: Container(
//         width: 120,
//         height: 120,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white.withOpacity(0.5)),
//         child: const Icon(Icons.local_shipping,
//             size: 50, color: Colors.black),
//       ),
//     );
//   }

//   Widget _buildTimerBadge(BuildContext context, SearchTimerState timer) {

//     return Positioned(
//       top: 20,
//       left: 0,
//       right: 0,
//       child: Column(
//         children: [
//           Text(
//             "${timer.secondsLeft}s",
//             style: const TextStyle(fontSize: 20, color: Colors.white),
//           ),
//           const SizedBox(height: 10),

//           // progress bar
//           Container(
//             width: 220,
//             height: 10,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: 220 * timer.progress,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFDDBA4A),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
