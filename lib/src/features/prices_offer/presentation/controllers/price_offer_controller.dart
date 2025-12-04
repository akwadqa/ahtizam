import 'package:ahtizam/src/core/enums/order_status.dart';
import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/domain/models/order/price_offer/driver_offer_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/prices_offer/data/repositories/prices_offer_repository.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/prices_order_data_controller.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/routing/app_router_provider.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'price_offer_controller.g.dart';

class PriceOfferState {
  final List<DriverOfferModel> availableOffers;
  final DriverOfferModel? selectedOffer;
  final bool isListening;
  final String? errorMessage;

  const PriceOfferState({
    this.availableOffers = const [],
    this.selectedOffer,
    this.isListening = false,
    this.errorMessage,
  });

  PriceOfferState copyWith({
    List<DriverOfferModel>? availableOffers,
    DriverOfferModel? selectedOffer,
    bool? isListening,
    String? errorMessage,
  }) {
    return PriceOfferState(
      availableOffers: availableOffers ?? this.availableOffers,
      selectedOffer: selectedOffer ?? this.selectedOffer,
      isListening: isListening ?? this.isListening,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@Riverpod(keepAlive: true)
class PriceOfferController extends _$PriceOfferController {
  String? _previousStatus;
  bool _listening = false;

  @override
  FutureOr<PriceOfferState?> build() => const PriceOfferState();

  /// Start listening for price offers on the given order ID
  Future<void> startListeningForOffers({
    required String orderId,
    required BuildContext context,
  }) async {
    try {
        debugPrint("****** startListeningForOffers: 1");

      if (_listening || (state.value?.isListening ?? false)) return;
        debugPrint("****** startListeningForOffers: 2 fat a listen");
      

      state = AsyncData(
        state.value?.copyWith(isListening: true, errorMessage: null) ??
            const PriceOfferState(isListening: true),
      );
        debugPrint("****** startListeningForOffers: 3");

      final socketService = ref.read(socketServiceProvider);
      final user = ref.read(userDataProvider.notifier).userinformation;
      final mapService = ref.read(mapControllerProvider.notifier);
      _listening = true;
        debugPrint("****** startListeningForOffers: 4");

      await socketService.connect(user.token);
        debugPrint("****** startListeningForOffers: 5");

      void onOrder(data) async {
        debugPrint("🎛️ Received price offer data: $data");
        if (data == null) return;

        try {
          final priceOfferResponse = QuickOrderDetailsModel.fromJson(data);
          final status = OrderStatusExtension.fromString(
            priceOfferResponse.status,
          );

          if (status == OrderStatus.noDriverFound ||
              status == "noDriverFound") {
            await showNoDriverException(context, priceOfferResponse.status);
            return;
          }

          await ref
              .read(quickOrderControllerProvider.notifier)
              .setNewOrderDetails(priceOfferResponse);

          if ((priceOfferResponse.offers?.isNotEmpty ?? false)) {
            state = AsyncData(
              state.value?.copyWith(
                    availableOffers: priceOfferResponse.offers!,
                  ) ??
                  PriceOfferState(availableOffers: priceOfferResponse.offers!),
            );

            await _handleNewOffers(priceOfferResponse.offers!, context);
          } else {
            debugPrint("📭 No offers received in this update");
          }

          final appRouter = ref.watch(appRouterProvider);
          final currentContext = appRouter.navigatorKey.currentContext;

          if (status != OrderStatus.noDriverFound &&
              priceOfferResponse.driverData?.driverId != null &&
              currentContext != null) {
            // await ref
            //     .read(homeServiceProvider.notifier)
            //     .resetLayers(currentContext);
            await showNoDriverException(context, priceOfferResponse.status);
            return;
          }

          if (currentContext != null) {
            await _handleOrderStatusUpdate(
              status,
              priceOfferResponse,
              mapService,
              currentContext,
            );
          }
        } catch (e, st) {
          debugPrint("❌ Error parsing price offer data: $e");
          state = AsyncError("Failed to parse offers", st);
        }
      }

      socketService.on(orderId, onOrder);

      ref.onDispose(() {
        debugPrint('[PO] onDispose: detaching handlers for $orderId');
        socketService.off(orderId, onOrder);
        // socket.off(SocketEvents.chatMessage, onChat);
        _listening = false;
        // _detachAll();
      });
      debugPrint("✅ Started listening for price offers on order: $orderId");

      // socketService.on(SocketEvents.chatMessage, (data) {
      //   debugPrint("chatMessage => $data");
      //   if (data is List) {
      //     final messages = List<Map<String, dynamic>>.from(data);
      //     ref
      //         .read(chatControllerProvider.notifier)
      //         .handleIncomingMessages(messages);
      //   }
      // });
    } catch (e, st) {
      debugPrint("❌ Error starting price offer listener: $e");
      state = AsyncError("Failed to start listening for offers", st);
    }
  }

  Future<void> processOrder(BuildContext context) async {
    await ref
        .read(mapControllerProvider.notifier)
        .moveCameraToIncludeRoute(fromUserToSource: true);
    await Future.delayed(const Duration(milliseconds: 500));
    await ref.read(mapControllerProvider.notifier).captureScreenshot();

    final isDriverKnown = state.value?.selectedOffer != null;
    if (isDriverKnown) {
      showCustomConnectingToDriverDialog(context);
    } else {
      showSearchingTruckLoading(context: context);
    }

    try {
      await ref
          .read(quickOrderControllerProvider.notifier)
          .processAndStartSession(context, paymentMethod: null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> _handleOrderStatusUpdate(
    OrderStatus? status,
    QuickOrderDetailsModel result,
    dynamic mapService,
    BuildContext context,
  ) async {
    if (_previousStatus == status?.name) return;
    _previousStatus = status?.name;

    switch (status) {
      case OrderStatus.accepted:
        debugPrint("✅ Order Status: Accepted by driver");
        await mapService.getPolylinePoints(fromUserToSource: true);
        break;

      case OrderStatus.driverOnTheWay:
        debugPrint("🚗 Driver is on the way");
        await mapService.getPolylinePoints(
          fromDriverToUser: true,
          fromUserToSource: false,
        );
        await mapService.getPolylineDriverToMePoints();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primary,
            content: Text(
              "driver_on_the_way".tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
        break;

      case OrderStatus.driverArrived:
        debugPrint("📍 Driver has arrived");
        await mapService.getPolylinePoints(
          fromDriverToUser: true,
          fromUserToSource: false,
        );
        showAutoClosingDialog(
          context,
          "driver_arrived".tr(),
          icon: const Icon(Icons.check_circle, color: AppColors.green),
        );
        break;

      case OrderStatus.onTrip:
        debugPrint("🚚 Trip in progress");
        await mapService.getPolylinePoints(
          fromDriverToUser: false,
          fromUserToSource: false,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("on_trip".tr())));
        break;

      case OrderStatus.finished:
        debugPrint("🏁 Trip finished");
        await _handleOrderFinished(context);
        break;

      case OrderStatus.cancelled:
        debugPrint("❌ Trip cancelled");
        await _handleOrderCancelled(context);
        break;

      case OrderStatus.noDriverFound:
        debugPrint("❌ No driver found");
        await showNoDriverException(context, "No drivers available");
        break;

      default:
        break;
    }
  }

  Future<void> _handleOrderFinished(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.newRed,
        content: Text("finished_thank_you".tr()),
      ),
    );
    await showRateDriverDialog(context);
    _resetAfterOrderComplete();
  }

  void _resetAfterOrderComplete() {
    // state=AsyncData(null);
    ref.read(mapControllerProvider.notifier)
      ..resetPoints()
      ..updateLocation();
    ref.read(locationSearchControllerProvider.notifier).restoreSearchFields();
    ref
        .read(hideLayersDuringOrderControllerProvider.notifier)
        .hideLayersDuringOrder();
    ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();
  }

  Future<void> _handleOrderCancelled(BuildContext context) async {
    final socketService = ref.read(socketServiceProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.newRed,
        content: Text("order_cancelled_msg".tr()),
      ),
    );
    resetOrderDetails();
    _resetAfterOrderComplete();
    await showAutoClosingDialog(context, "order_cancelled_msg".tr());
    socketService.disconnect();
  }

  void resetOrderDetails() {
    debugPrint("resetOrderDetails");
    stopListening();
    state = const AsyncData(null);
    debugPrint("🔄 Price offer controller reset");
  }

  Future<void> showNoDriverException(
    BuildContext context,
    String? message,
  ) async {
    debugPrint('[PriceOffer] showNoDriverException: $message');
    if (!context.mounted) return;
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
    await showAutoClosingDialog(
      context,
      "${message ?? "No available drivers."}\n${"try_again".tr(context: context)}",
    );
  }

  Future<void> _handleNewOffers(
    List<DriverOfferModel> newOffers,
    BuildContext context,
  ) async {
    debugPrint("📥 Processing ${newOffers.length} new offers");
    state = AsyncData(
      state.value?.copyWith(availableOffers: newOffers) ??
          PriceOfferState(availableOffers: newOffers),
    );
    ref.read(pricesOfferDataControllerProvider.notifier).setOffers(newOffers);
    await _navigateToOffersScreen(context);
  }

  Future<void> _navigateToOffersScreen(BuildContext context) async {
    final appRouter = ref.read(appRouterProvider);
    appRouter.push(PricesOfferRoute());
  }

  void stopListening() {
    final socketService = ref.read(socketServiceProvider);
    socketService.disconnect();
    final cur = state.value;
    _listening = false;
    state = AsyncData(cur?.copyWith(isListening: false));
    debugPrint("🔇 Stopped listening for price offers");
  }

  void _clearOffers() {
    final cur = state.value;
    state = AsyncData(
      cur?.copyWith(availableOffers: [], selectedOffer: null) ??
          const PriceOfferState(),
    );
  }

  Future<bool> selectPriceOffer(DriverOfferModel offer) async {
    state = AsyncLoading();
    final priceOfferRepo = ref.read(pricesOfferRepositoryProvider);
    final result = await priceOfferRepo.selectPriceOffer(
      orderOfferId: offer.quickOrderOfferId,
    );

    if (result.hasSucceeded) {
      ref
          .read(quickOrderControllerProvider.notifier)
          .setQuickOrderModel(result.data!);
      // await ref
      //     .read(quickOrderControllerProvider.notifier)
      //     .processAndStartSession(ref.read(appRouterProvider).navigatorKey.currentContext!);
      selectOffer(offer);

      return true;
    } else {
      state = AsyncError("Error occured", StackTrace.current);
      throw AppException(result.message ?? "select offer failed");
    }
  }

  void reset() {
    stopListening();
    state = const AsyncData(null);
    debugPrint("🔄 Price offer controller reset");
  }

  void selectOffer(DriverOfferModel offer) {
    final cur = state.value;
    state = AsyncData(
      cur?.copyWith(selectedOffer: offer) ??
          PriceOfferState(selectedOffer: offer),
    );
  }

  Future<bool> acceptSelectedOffer() async {
    final selectedOffer = state.value?.selectedOffer;
    if (selectedOffer == null) {
      debugPrint("❌ No offer selected");
      return false;
    }
    try {
      debugPrint("🤝 Accepting offer: ${selectedOffer.quickOrderOfferId}");
      _clearOffers();
      return true;
    } catch (e, st) {
      debugPrint("❌ Error accepting offer: $e");
      state = AsyncError("Failed to accept offer", st);
      return false;
    }
  }
}

// @Riverpod(keepAlive: true)
// class PriceOfferController extends _$PriceOfferController {
//   String? _previousStatus;

//   @override
//   PriceOfferState build() => const PriceOfferState();

//   /// Start listening for price offers on the given order ID
//   Future<void> startListeningForOffers({
//     required String orderId,
//     required BuildContext context,
//   }) async {
//     // if (state.isListening) {
//     //   debugPrint("⚠️ Already listening for offers");
//     //   return;
//     // }

//     try {
//       state = state.copyWith(isListening: true, errorMessage: null);

//       final socketService = ref.read(socketServiceProvider);
//       final user = ref.read(userDataProvider.notifier).userinformation;
//       final mapService = ref.read(mapControllerProvider.notifier);

//       await socketService.connect(user.token);

//       socketService.on(orderId, (data) async {
//         debugPrint("🎛️ Received price offer data: $data");

//         if (data == null) return null;
//         // if (data["offers"] == null) return;

//         try {
//           final priceOfferResponse = QuickOrderDetailsModel.fromJson(data);

//           final status =
//               OrderStatusExtension.fromString(priceOfferResponse.status);
//           if (status == OrderStatus.noDriverFound ) {
//             // if (isFirstReceived) {
//             //   socketService.disconnect();
//             //   isFirstReceived = false;
//             // }
//             // Navigator.canPop(context);
//             showNoDriverException(context, priceOfferResponse.status);
//             return state;
//           }
//           // if (data["offers"] == null) return;

//           ref
//               .read(quickOrderControllerProvider.notifier)
//               .setNewOrderDetails(priceOfferResponse);

//           // Only handle if we have offers
//           if (priceOfferResponse.offers!.isNotEmpty) {
//             state = state.copyWith(availableOffers: priceOfferResponse.offers!);

//             await _handleNewOffers(priceOfferResponse.offers!, context);
//           } else {
//             debugPrint("📭 No offers received in this update");
//           }
//           final appRouter = ref.watch(appRouterProvider);

//           final currentContext = appRouter.navigatorKey.currentContext;

//           if (status != OrderStatus.noDriverFound &&
//               priceOfferResponse.driverData?.driverId != null) {
//             if (currentContext != null) {
//               await ref
//                   .read(homeServiceProvider.notifier)
//                   .resetLayers(currentContext);
//             }
//             // _hasResetLayersAndOpenedSheet = true;
//           }
//           if (currentContext != null) {
//             await _handleOrderStatusUpdate(
//                 status, priceOfferResponse, mapService, currentContext);
//           }
//         } catch (e) {
//           debugPrint("❌ Error parsing price offer data: $e");
//           state = state.copyWith(errorMessage: "Failed to parse offers");
//         }
//       });

//       debugPrint("✅ Started listening for price offers on order: $orderId");

//       // Set up chat message listener
//       socketService.on(SocketEvents.chatMessage, (data) {
//         debugPrint("chatMessage => $data");
//         if (data is List) {
//           final messages = List<Map<String, dynamic>>.from(data);
//           ref
//               .read(chatControllerProvider.notifier)
//               .handleIncomingMessages(messages);
//         }
//       });
//       // final driverLat = state.selectedOffer.lat;
//       //   final driverLng =state.selectedOffer.lng;
//       // Update driver location on map
//       // if (driverLat != null && driverLng != null) {
//       //   final driverLocation = LatLng(driverLat, driverLng);
//       //   await mapService.updateDriverLocation(driverLocation);
//       // }

//       // Reset layers and open bottom sheet (first time only)
//       // if (
//       //     status != OrderStatus.noDriverFound &&
//       //     result.driverData?.driverId != null) {
//       //   if (currentContext != null) {
//       //     await ref.read(homeServiceProvider.notifier).resetLayers(currentContext);
//       //   }
//       //   // _hasResetLayersAndOpenedSheet = true;
//       // }

//       // Update order details
//       // await setNewOrderDetails(result);

//       // Handle status changes
//     } catch (e) {
//       debugPrint("❌ Error starting price offer listener: $e");
//       state = state.copyWith(
//           isListening: false,
//           errorMessage: "Failed to start listening for offers");
//     }
//   }
// Future<void> processOrder(BuildContext context) async {

//     await ref.read(mapControllerProvider.notifier).moveCameraToIncludeRoute(
//     fromUserToSource: true,
//     );
//     await Future.delayed(const Duration(milliseconds: 500));
//     await ref.read(mapControllerProvider.notifier).captureScreenshot();

    
//     final isDriverKnown =state.selectedOffer!=null;
//     if (isDriverKnown) {
//       // ✅ Show a different loading or skip entirely
//       showCustomConnectingToDriverDialog(context); // 👈 your own UI
//     } else {
//       showSearchingTruckLoading(context: context); // ⛔ normal truck search
//     }


//     try {
//       await ref
//           .read(quickOrderControllerProvider.notifier)
//           .processAndStartSession(
//             context,
//             paymentMethod: null,
//           );
//     } catch (e) {

//       state =state.copyWith(
//         errorMessage : e.toString()
//       );

//     }
//   }
//   Future<void> _handleOrderStatusUpdate(
//     OrderStatus? status,
//     QuickOrderDetailsModel result,
//     dynamic mapService,
//     BuildContext context,
//   ) async {
//     // Skip if status hasn't changed
//     if (_previousStatus == status?.name) return;
//     _previousStatus = status?.name;

//     switch (status) {
//       case OrderStatus.accepted:
//         debugPrint("✅ Order Status: Accepted by driver");
//         await mapService.getPolylinePoints(fromUserToSource: true);
//         break;

//       case OrderStatus.driverOnTheWay:
//         debugPrint("🚗 Driver is on the way");
//         await mapService.getPolylinePoints(
//             fromDriverToUser: true, fromUserToSource: false);
//         await mapService.getPolylineDriverToMePoints();

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: AppColors.primary,
//             content: Text(
//               "driver_on_the_way".tr(),
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         );
//         break;

//       case OrderStatus.driverArrived:
//         debugPrint("📍 Driver has arrived");
//         await mapService.getPolylinePoints(
//             fromDriverToUser: true, fromUserToSource: false);
//         showAutoClosingDialog(
//           context,
//           "driver_arrived".tr(),
//           icon: const Icon(Icons.check_circle, color: AppColors.green),
//         );
//         break;

//       case OrderStatus.onTrip:
//         debugPrint("🚚 Trip in progress");
//         await mapService.getPolylinePoints(
//             fromDriverToUser: false, fromUserToSource: false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("on_trip".tr())),
//         );
//         break;

//       case OrderStatus.finished:
//         debugPrint("🏁 Trip finished");
//         await _handleOrderFinished(context);
//         break;

//       case OrderStatus.cancelled:
//         debugPrint("❌ Trip cancelled");
//         await _handleOrderCancelled(context);
//         break;

//       case OrderStatus.noDriverFound:
//         debugPrint("❌ No driver found");
//         showNoDriverException(context, "No drivers available at the moment.");
//         break;

//       default:
//         break;
//     }
//   }

//   /// Handle order finished
//   Future<void> _handleOrderFinished(BuildContext context) async {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: AppColors.newRed,
//         content: Text("finished_thank_you".tr()),
//       ),
//     );

//     await showRateDriverDialog(context);
//     _resetAfterOrderComplete();
//   }

//   /// Reset UI after order completion
//   void _resetAfterOrderComplete() {
//     ref.read(mapControllerProvider.notifier)
//       ..resetPoints()
//       ..updateLocation();

//     ref.read(locationSearchControllerProvider.notifier).restoreSearchFields();

//     ref
//         .read(hideLayersDuringOrderControllerProvider.notifier)
//         .hideLayersDuringOrder();

//     ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();
//   }

//   /// Handle order cancellation
//   Future<void> _handleOrderCancelled(BuildContext context) async {
//     final socketService = ref.read(socketServiceProvider);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: AppColors.newRed,
//         content: Text("order_cancelled_msg".tr()),
//       ),
//     );

//     resetOrderDetails();
//     _resetAfterOrderComplete();
//     showAutoClosingDialog(context, "order_cancelled_msg".tr());
//     socketService.disconnect();
//   }

//   void resetOrderDetails() {
//     debugPrint("resetOrderDetails");

//     final current = state;
//     state = PriceOfferState();
//   }

//   /// Show no driver exception dialog
//  Future<void> showNoDriverException(BuildContext context, String? message) async {
//   debugPrint('[PriceOffer] showNoDriverException: $message');

//   // ✅ تأكد إن الـ context mounted
//   if (!context.mounted) return;

//   // ✅ pop بشكل آمن
//   if (Navigator.of(context, rootNavigator: true).canPop()) {
//     Navigator.of(context, rootNavigator: true).pop();
//   }

//   await showAutoClosingDialog(
//     context,
//     "${message ?? "No available drivers."}\n${"try_again".tr(context: context)}",
//   );
// }


//   /// Handle new offers received from socket
//   Future<void> _handleNewOffers(
//       List<DriverOfferModel> newOffers, BuildContext context) async {
//     debugPrint("📥 Processing ${newOffers.length} new offers");

//     // Update state with new offers
//     state = state.copyWith(availableOffers: newOffers);

//     // Navigate to offers screen
//     await _navigateToOffersScreen(context);
//   }

//   /// Navigate to the offers screen
//   Future<void> _navigateToOffersScreen(BuildContext context) async {
//     final appRouter = ref.read(appRouterProvider);

//     // You can customize this navigation based on your routing setup
//     // Example: appRouter.push('/price-offers');

//     // Or show as a bottom sheet/dialog
//     // await _showOffersBottomSheet(context);
//     appRouter.push(PricesOfferRoute());
//     // context.pushRoute(PricesOfferRoute());
//     // Navigator.of(context).push(MaterialPageRoute(
//     //   builder: (context) => const PricesOfferScreen(),
//     // ));
//   }

//   void stopListening() {
//     if (!state.isListening) return;

//     final socketService = ref.read(socketServiceProvider);
//     socketService.disconnect();

//     state = state.copyWith(isListening: false);
//     debugPrint("🔇 Stopped listening for price offers");
//   }

//   /// Clear all offers
//   void _clearOffers() {
//     state = state.copyWith(
//       availableOffers: [],
//       selectedOffer: null,
//     );
//   }

//   Future<bool> selectPriceOffer(DriverOfferModel offer) async {
//     final priceOfferRepo = ref.read(pricesOfferRepositoryProvider);
//     final result = await priceOfferRepo.selectPriceOffer(
//         orderOfferId: offer.quickOrderOfferId);

//     if (result.hasSucceeded) {
//           // ⬇️ Inject accepted order into QuickOrderController

//       ref
//           .read(quickOrderControllerProvider.notifier)
//           .setQuickOrderModel(result.data!);

//              ref.read(quickOrderControllerProvider.notifier)
//        .processAndStartSession(
//          ref.read(appRouterProvider).navigatorKey.currentContext!,
//        );
//       selectOffer(offer);

//       return true;
//     } else {
//       throw AppException(result.message ?? "select offer failed");
//     }
//   }

//   /// Reset the controller state
//   void reset() {
//     stopListening();
//     state = const PriceOfferState();
//     debugPrint("🔄 Price offer controller reset");
//   }

//   void selectOffer(DriverOfferModel offer) {
//     debugPrint(
//         "✅ Selected offer from driver: ${offer.driverName} - Price: ${offer.price}");
//     state = state.copyWith(selectedOffer: offer);
//   }

//   /// Accept the selected offer
//   Future<bool> acceptSelectedOffer() async {
//     final selectedOffer = state.selectedOffer;
//     if (selectedOffer == null) {
//       debugPrint("❌ No offer selected");
//       return false;
//     }

//     try {
//       debugPrint("🤝 Accepting offer: ${selectedOffer.quickOrderOfferId}");

//       // Here you would call your API to accept the offer
//       // final result = await ref.read(homeRepositoryProvider).acceptOffer(
//       //   offerId: selectedOffer.quickOrderOfferId,
//       // );

//       // For now, just simulate success
//       debugPrint("✅ Offer accepted successfully");

//       // Clear offers after acceptance
//       _clearOffers();

//       return true;
//     } catch (e) {
//       debugPrint("❌ Error accepting offer: $e");
//       state = state.copyWith(errorMessage: "Failed to accept offer");
//       return false;
//     }
//   }
// }
// ! //////////////
// price_offer_controller.dart
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'price_offer_controller.g.dart';

// class PriceOfferState {
//   final List<DriverOfferModel> availableOffers;
//   final DriverOfferModel? selectedOffer;
//   final bool isListening;
//   final String? error;

//   const PriceOfferState({
//     this.availableOffers = const [],
//     this.selectedOffer,
//     this.isListening = false,
//     this.error,
//   });

//   PriceOfferState copyWith({
//     List<DriverOfferModel>? availableOffers,
//     DriverOfferModel? selectedOffer,
//     bool? isListening,
//     String? error,
//   }) {
//     return PriceOfferState(
//       availableOffers: availableOffers ?? this.availableOffers,
//       selectedOffer: selectedOffer ?? this.selectedOffer,
//       isListening: isListening ?? this.isListening,
//       error: error ?? this.error,
//     );
//   }
// }

// @Riverpod(keepAlive: true)
// class PriceOfferController extends _$PriceOfferController {
//   bool _listening = false;

//   @override
//   PriceOfferState build() => const PriceOfferState();

//   Future<void> startListeningForOffers({
//     required String orderId,
//     required BuildContext context,
//   }) async {
//     if (_listening) return;
//     _listening = true;
//     state = state.copyWith(isListening: true, error: null);

//     final socket = ref.read(socketServiceProvider);
//     final user = ref.read(userDataProvider.notifier).userinformation;
//     await socket.connect(user.token);

//     void orderHandler(dynamic data) async {
//       if (data == null) return;
//       try {
//         final details = QuickOrderDetailsModel.fromJson(data);
//         final status = OrderStatusExtension.fromString(details.status);

//         // لو مفيش عروض أو NoDriverFound → بلّغ الواجهة فقط
//         if (status == OrderStatus.noDriverFound || (details.offers?.isEmpty ?? true)) {
//           // UI تقدر تعرض رسالة "لا يوجد سائق"
//           return;
//         }

//         // حدِّث العروض
//         final offers = details.offers!;
//         state = state.copyWith(availableOffers: offers);
//       } catch (e) {
//         state = state.copyWith(error: "Failed to parse offers");
//       }
//     }

//     socket.on(orderId, orderHandler);

//     ref.onDispose(() {
//       socket.off(orderId, orderHandler);
//       _listening = false;
//     });
//   }

//   void stopListening() {
//     if (!_listening) return;
//     // مفيش حاجة إضافية هنا لأننا عملنا off في onDispose، لكن نوقف الـflag
//     _listening = false;
//     state = state.copyWith(isListening: false);
//   }

//   void selectOffer(DriverOfferModel offer) {
//     state = state.copyWith(selectedOffer: offer);
//   }

//   /// مثال: نداء API لاختيار العرض (ثم QuickOrderController يتولى processAndStartSession)
//   Future<bool> confirmOfferSelection() async {
//     final offer = state.selectedOffer;
//     if (offer == null) return false;

//     final repo = ref.read(pricesOfferRepositoryProvider);
//     final res = await repo.selectPriceOffer(orderOfferId: offer.quickOrderOfferId);

//     if (res.hasSucceeded) {
//       return true;
//     } else {
//       state = state.copyWith(error: res.message ?? "select offer failed");
//       return false;
//     }
//   }
// }

// ! //////////////

  /// Show offers in a bottom sheet
  // Future<void> _showOffersBottomSheet(BuildContext context) async {
  //   await 
    
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => PriceOffersBottomSheet(
  //       offers: state.availableOffers,
  //       onOfferSelected: selectOffer,
  //     ),
  //   );
  // }

  /// Select a specific offer
  
  /// Stop listening for offers
  