import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/routing/app_routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/controllers/toggle_layers_controllers/change_request_order_state_service.dart';
import '../presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';

part 'home_service.g.dart';

@riverpod
class HomeService extends _$HomeService {
  @override
  void build() {}

  bool isPreviousRouteVerification(BuildContext context) {
    final stack = context.router.stack;

    if (stack.length < 2) return false; // no previous route

    final previous = stack[stack.length - 2];

    return previous.routeData.path ==
        AppRoutes.verify; // or .name if you have defined names
  }
// Future<void> resetLayers(BuildContext context) async {
//   final router = context.router;

//   debugPrint("🔁 Resetting navigation stack to MainRoute");
//   router.replaceAll([const MainRoute()]); // 🚨 This clears previous routes

//   ref.read(hideLayersDuringOrderControllerProvider.notifier).hideLayersDuringOrder();
//   ref.read(changeRequestOrderStateServiceProvider.notifier).toggleWidget();
// }

  Future<void> resetLayers(BuildContext context) async {
     int maxPops = 3;
    final navigator = Navigator.of(context, rootNavigator: true);
    if (isPreviousRouteVerification(context)) {
      debugPrint("We came from verification page");
    } else {
      debugPrint("We came from another page");
    }

    // Defensive: don't pop if there's only one route
    final modalRoute = ModalRoute.of(context);
    if (modalRoute?.isFirst == true) {
      debugPrint("Already at the base of the stack — no pop needed");
    } else {
      debugPrint("Current stack: ${context.router.stack.map((e) => e.name)}");
if(context.router.stack.map((e) => e.name).length > 2){
      debugPrint("maxxxxxxxxxxxx");

       maxPops = 2;

}
      int pops = 0;
      while (navigator.canPop() && pops < maxPops) {
        debugPrint("Current stack: ${context.router.stack.map((e) => e.name)}");

        navigator.pop();
        pops++;
        await Future.delayed(const Duration(milliseconds: 2));
      }
    }

      ref
          .read(hideLayersDuringOrderControllerProvider.notifier)
          .hideLayersDuringOrder();

      ref.read(changeRequestOrderStateServiceProvider.notifier).toggleWidget();
  }

// Future<void> resetLayers(BuildContext context) async {
//   final navigator = Navigator.of(context, rootNavigator: true);
//   int maxPops = 3;
//   int pops = 0;

//   while (navigator.canPop() && pops < maxPops) {
//     navigator.pop();
//     pops++;
//     await Future.delayed(const Duration(milliseconds: 2));
//   }

//   ref
//       .read(hideLayersDuringOrderControllerProvider.notifier)
//       .hideLayersDuringOrder();
//     // final scanned = ref.watch(scanDriverQrControllerProvider).value?.scanned??false ;
//   //  if (scanned) {
//   // ref
//   //     .read(scanDriverQrControllerProvider.notifier)
//   //     .resetScannedValue();
//       // }
//   ref
//       .read(changeRequestOrderStateServiceProvider.notifier)
//       .toggleWidget();
//   // ref
//   //     .read(quickOrderControllerProvider.notifier)
//   //     .resetOrderDetails();
// }
}
