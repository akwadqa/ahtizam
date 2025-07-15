import 'package:ahtizam/src/constants/socket_events.dart';
import 'package:ahtizam/src/core/enums/order_status.dart';
import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/messages/presentation/controller/chat_controller.dart';
import 'package:ahtizam/src/features/payment/presentation/controller/payment_controller.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:ahtizam/src/routing/app_router_provider.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';

part 'quick_order_controller.g.dart';

class OrderState {
  final QuickOrderDetailsModel? orderDetails;
  final QuickOrderModel? orderModel;

  OrderState({this.orderDetails, this.orderModel});

  OrderState copyWith(
      {QuickOrderDetailsModel? orderDetails, QuickOrderModel? orderModel}) {
    return OrderState(
      orderDetails: orderDetails ?? this.orderDetails,
      orderModel: orderModel ?? this.orderModel,
    );
  }
}

@Riverpod(keepAlive: true)
class QuickOrderController extends _$QuickOrderController {
  String? _couponCode;
  bool _hasResetLayersAndOpenedSheet = false;
  bool _handledNoDriverOnce = false;
  late QuickOrderModel _quickOrderModel;
  String? _previousStatus;

  @override
  FutureOr<OrderState?> build() => null;

  Future<QuickOrderModel?> createOrder({String? couponCode}) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(homeRepositoryProvider);
      final user = ref.read(userDataProvider.notifier).userinformation;
      final coords =
          ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
      final serviceType = ref.watch(selectServiceTypeControllerProvider);

      if (coords == null) {
        state = AsyncError('Invalid coordinates', StackTrace.current);
        return null; 
      }

      final response = await repo.createQuickOrder(
        email: user.email,
        passengerCoordinates: CoordinatesParams(
          lat: coords[0].lat,
          lng: coords[0].lng,
          address: coords[0].address,
        ),
        destinationCoordinates: CoordinatesParams(
          lat: coords[1].lat,
          lng: coords[1].lng,
          address: coords[1].address,
        ),
        searviceItemId: serviceType.value!.selectedServiceType!.serviceId,
        couponCode: couponCode,
      );

      final quickOrderId = response.data?.quickOrderId;
      if (quickOrderId == null || quickOrderId.isEmpty || response.hasFailed) {
        throw Exception(response.message ?? "No available drivers.");
      }

      // final current = state.value;
      state = AsyncData(OrderState(orderModel: response.data));
      debugPrint(
          "✅ createOrder success => orderModel: ${response.data?.quickOrderId}");
      return response.data;

    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  setNewOrderDetails(QuickOrderDetailsModel? order) async {
    final current = state.value;

    if (current == null) {
      debugPrint(
          "⚠️ state.value is null — fallback to create dummy orderModel");
      // final fallbackOrderModel = state.value?.orderModel?.copyWith(
      //   quickOrderId: order?. ?? 'UNKNOWN-ID',
      // );
      state = AsyncData(OrderState(
        orderModel: _quickOrderModel,
        orderDetails: order,
      ));

      debugPrint(
          "❌ setNewOrderDetails => koko: ${state.value?.orderModel?.quickOrderId}");
      debugPrint(
          "❌ setNewOrderDetails => orderModel: ${_quickOrderModel.quickOrderId}");

      return;
    }

    final updated = current.copyWith(orderDetails: order);
    state = AsyncData(updated);
    debugPrint(
        "✅ setNewOrderDetails => orderModel: ${updated.orderModel?.quickOrderId}");
  }

  Future<void> startOpenNewOrderSocket(
    BuildContext context, {
    required String paymentMethod,
  }) async {
    final repo = ref.read(homeRepositoryProvider);
    final socketService = ref.read(socketServiceProvider);
    final user = ref.read(userDataProvider.notifier).userinformation;
    final coords =
        ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
    final mapScreenshotFile =
        ref.watch(mapControllerProvider.notifier).mapScreenshotFile;
    final paymentController = ref.read(paymentControllerProvider.notifier);
    final driverId = ref.watch(scanDriverQrControllerProvider).value?.driverId;
    final order = state.value?.orderModel;

    if (order == null || coords == null) {
      state = AsyncError('Missing order or location data', StackTrace.current);
      return;
    }
    final process = await repo.processQuickOrder(
        quickOrderId: order.quickOrderId,
        driverId: driverId,
        paymentMethod: paymentMethod,
        mapImage: mapScreenshotFile);

// ✅ Always mark as paid first!
    paymentController.isOrderPaied();

    if (process.error == 1 || process.data == null) {
      showNoDriverException(context, process.message);
      return;
    }
    _quickOrderModel = process.data!;
    await connectSocketAndListen(
        socketService, order.quickOrderId, user.token, context);
  }

  Future<void> connectSocketAndListen(
    SocketService socketService,
    String quickOrderId,
    String token,
    BuildContext context, {
    bool isFirstRecieved = true,
  }) async {
    final appRouter = ref.watch(appRouterProvider);

    try {
      // final currentContext = appRouter.navigatorKey.currentContext;

      final mapService = ref.read(mapControllerProvider.notifier);
      await socketService.connect(token);
      socketService.on(quickOrderId, (data) async {
        if (data == null) return;
        debugPrint("🎛️ Received order details: $data");
        final result = QuickOrderDetailsModel.fromJson(data);
        final driverLat = result.driverData?.lat;
        final driverLng = result.driverData?.lng;
        // if (_handledNoDriverOnce) return;
        final status = OrderStatusExtension.fromString(result.status);
        if (status == OrderStatus.noDriverFound ||
            result.driverData?.driverId == null) {
          if (isFirstRecieved) {
            socketService.disconnect();
            isFirstRecieved = false;
          }
          showNoDriverException(context, result.status);
          return;
        }
      socketService.on(SocketEvents.chatMessage, (data) {
  debugPrint("chatMessage => $data");
  // if (data == null || data is! List) return;

 if (data is List) {
    debugPrint("📥 chatMessage orginal");

    final messages = List<Map<String, dynamic>>.from(data);
    ref.read(chatControllerProvider.notifier).handleIncomingMessages(messages);
  }
});

        if (driverLat != null && driverLng != null) {
          final driverLocation = LatLng(driverLat, driverLng);
          await mapService.updateDriverLocation(driverLocation);
        }

        /// Handle status-specific dialogs
        final currentContext = appRouter.navigatorKey.currentContext;

        // ✅ Only first time: reset layers & open bottom sheet
        if (!_hasResetLayersAndOpenedSheet &&
            status != OrderStatus.noDriverFound &&
            result.driverData?.driverId != null) {
          // state=AsyncData(state.copyWithPrevious(state.value.orderModel))
          if (currentContext != null) {
            await ref
                .read(homeServiceProvider.notifier)
                .resetLayers(currentContext);
          } // ensure layers reset

          _hasResetLayersAndOpenedSheet = true;
        }
       // Skip if the order status hasn't changed
        if (_previousStatus != status?.name) {
          // Update the order model, but don't show a message or dialog
        _previousStatus = status.toString();
          debugPrint("Order status hasn't changed, just updating order details.${status.toString()}");
          debugPrint("Order status hasn't changed, just updating order details.$_previousStatus");
          debugPrint("Order status hasn't changed, just updating order details.${status?.name}");
          // return;
        }
          debugPrint("Order status hasn't changed, $_previousStatus");

        // // Update the previous status to the current one
        // _previousStatus = status.toString();

        // Always update the order details
        // await setNewOrderDetails(result);
        // String currentStatus = result.status;
        await setNewOrderDetails(result);
        // if (_previousStatus != currentStatus) {
        // _previousStatus = currentStatus;
        // }
        // Update the previous status
        // updateStateIfStatusChanged(status!.name, result);

        // final currentContext = appRouter.navigatorKey.currentContext;
        if (currentContext == null) {
          debugPrint("❗ Current context is null — cannot show UI.");
          return;
        }

        switch (status) {
          case OrderStatus.accepted:
            debugPrint("✅ Order Status: Accepted by driver");
            await mapService.getPolylinePoints(fromUserToSource: true);
            if (_previousStatus != OrderStatus.accepted.toString()) {
              showAutoClosingDialog(
                currentContext,
                "accepted".tr(),
                icon: const Icon(Icons.check_circle, color: AppColors.green),
              );
            }
            // ScaffoldMessenger.of(currentContext).showSnackBar(
            //    SnackBar(content: Text("Driver has accepted your order".tr())),
            // );
            break;

          case OrderStatus.driverOnTheWay:
            debugPrint("🚗 Driver is on the way");
            await mapService.getPolylinePoints(
                fromDriverToUser: true, fromUserToSource: false);

            await mapService.getPolylineDriverToMePoints();
            // mapService.changeUserLocation();
            if (_previousStatus != OrderStatus.driverOnTheWay.toString()) {
              ScaffoldMessenger.of(currentContext).showSnackBar(
                SnackBar(
                    backgroundColor: AppColors.primary,
                    content: Text(
                      "driver_on_the_way".tr(),
                      style: TextStyle(color: Colors.white),
                    )),
                snackBarAnimationStyle: AnimationStyle(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.easeInOut),
              );
            }
            break;
          case OrderStatus.driverArrived:
            debugPrint("📍 Driver has arrived");
           await mapService.getPolylinePoints(
                fromDriverToUser: true, fromUserToSource: false);
            final currentContext = appRouter.navigatorKey.currentContext;
            if (currentContext != null) {
              if (_previousStatus != OrderStatus.driverArrived.toString()) {
                showAutoClosingDialog(
                  currentContext,
                  "driver_arrived".tr(),
                  icon: const Icon(Icons.check_circle, color: AppColors.green),
                );
              }
            } else {
              debugPrint(
                  "❗ Cannot show UI — context is null or widget is gone.");
            }
            break;

          case OrderStatus.onTrip:
            debugPrint("🚚 Trip in progress");
            await mapService.getPolylinePoints(
                fromDriverToUser: false, fromUserToSource: false);
            if (_previousStatus != OrderStatus.onTrip.toString()) {
              ScaffoldMessenger.of(currentContext).showSnackBar(
                SnackBar(content: Text("on_trip".tr())),
              );
            }

            break;

          case OrderStatus.finished:
            debugPrint("🏁 Trip finished");
            if (_previousStatus != OrderStatus.finished.toString()) {
              ScaffoldMessenger.of(currentContext).showSnackBar(
                SnackBar(
                    backgroundColor: AppColors.newRed,
                    content: Text("finished_thank_you".tr())),
              );
              ref.read(mapControllerProvider.notifier)
                ..resetPoints()
                ..updateLocation();
              await showRateDriverDialog(currentContext);

              ref
                  .read(hideLayersDuringOrderControllerProvider.notifier)
                  .hideLayersDuringOrder();
              ref
                  .read(showOrderFormControllerProvider.notifier)
                  .toggleVisibility();
            }

            // socketService.disconnect();

            break;

          case OrderStatus.completed:
            socketService.disconnect();
            ref.read(mapControllerProvider.notifier)
              ..resetPoints()
              ..updateLocation();
            break;

          case OrderStatus.noDriverFound:
            debugPrint("❌ No driver found");
            showNoDriverException(
                currentContext, "No drivers available at the moment.");
            break;

          default:
            debugPrint("⚠️ Unknown order status: $status");
            ScaffoldMessenger.of(currentContext).showSnackBar(
              const SnackBar(content: Text("Unknown order status received")),
            );
            break;
        }
      });
    } catch (e) {
      state = AsyncError("Error connecting to socket", StackTrace.current);
    }
  }

  Future<void> showNoDriverException(
      BuildContext context, String? message) async {
    if (Navigator.canPop(context)) Navigator.pop(context);
    await showAutoClosingDialog(
      context,
      "${message ?? "No available drivers."}\n${"try_again".tr(context: context)}",
    );
  }

  // Update state logic with status change check
  void updateStateIfStatusChanged(
      String currentStatus, QuickOrderDetailsModel? order) {
    // Skip the update if the status hasn't changed
    if (_previousStatus == currentStatus) {
      return;
    }
    // Update the previous status
    _previousStatus = currentStatus;

    // Create a new state
    // final newState = OrderState(
    //   orderDetails: order,
    //   orderModel: state.value?.orderModel,
    // );

    // state = AsyncData(newState); // Update state if the status changed
  }

  void resetOrderDetails() {
    debugPrint("resetOrderDetails");

    final current = state.value;
    state = AsyncData(null);
  }

  void setCouponCode(String couponCode) {
    _couponCode = couponCode;
  }
}
