// order_session_controller.dart
import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/payment/presentation/controller/payment_controller.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/price_offer_controller.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:ahtizam/src/routing/app_router_provider.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ahtizam/src/core/enums/order_status.dart';
import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/constants/socket_events.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart'; // لو هتستعمله من الـUI فقط سيبه
import 'package:ahtizam/src/features/messages/presentation/controller/chat_controller.dart';

import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';

import '../../../../theme/app_colors.dart';

part 'order_session_controller.g.dart';

// OrderSessionController: مسؤول أوحد عن السوكيت + status handling.

// QuickOrderController: مسؤول عن إنشاء الطلبات.

// PriceOfferController: مسؤول عن العروض فقط.
/// حالات الجلسة
sealed class OrderSessionState {
  const OrderSessionState();
}

class OrderIdle extends OrderSessionState {
  const OrderIdle();
}

class OrderActive extends OrderSessionState {
  final String orderId;
  final bool socketConnected;
  final OrderStatus? status;
  final QuickOrderDetailsModel? details;

  const OrderActive({
    required this.orderId,
    required this.socketConnected,
    this.status,
    this.details,
  });

  OrderActive copyWith({
    bool? socketConnected,
    OrderStatus? status,
    QuickOrderDetailsModel? details,
  }) {
    return OrderActive(
      orderId: orderId,
      socketConnected: socketConnected ?? this.socketConnected,
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }
}

@Riverpod(keepAlive: true)
class OrderSessionController extends _$OrderSessionController {
  static const _TAG = '[OS]';
  bool _listening = false;
  String? _previousStatus;
  bool _hasResetLayersAndOpenedSheet = false;
  @override
  OrderSessionState build() => const OrderIdle();

  Future<void> start({required String orderId}) async {
    // if (_listening && state is OrderActive) return;
    debugPrint('$_TAG start: already active for $orderId, skip');

    final socket = ref.read(socketServiceProvider);
    final user = ref.read(userDataProvider.notifier).userinformation;
    await socket.connect(user.token);
    final appRouter = ref.watch(appRouterProvider);
    final currentContext = appRouter.navigatorKey.currentContext!;

    debugPrint('$_TAG start: socket.connect DONE');
    final mapService = ref.read(mapControllerProvider.notifier);

    state = OrderActive(orderId: orderId, socketConnected: true);
    _listening = true;

    void onOrder(dynamic data) async {
      bool isFirstRecieved = true;

      debugPrint('$_TAG onOrder($orderId) event: ${data.runtimeType}');
      debugPrint("🎛️ Received order details: $data");
      if (data == null) return;
      // if(ref.read(paymentControllerProvider).value!.isTruckLoading){
      //   ref.read(paymentControllerProvider.notifier).resetLoading(currentContext);
      // }
      final details = QuickOrderDetailsModel.fromJson(data);
      final status = OrderStatusExtension.fromString(details.status);
      final driverId = details.driverData?.driverId;
      final driverLat = details.driverData?.lat;
      final driverLng = details.driverData?.lng;
      debugPrint(
        '$_TAG parsed: status=${status?.name} driverId=$driverId offers=${details.offers?.length}',
      );
      debugPrint('$_TAG onOrder: status=${status?.name}');
      if (status == OrderStatus.noDriverFound ||
          (details.driverData == null && details.offers == null)) {
        if (isFirstRecieved) {
          // socket.disconnect();
          isFirstRecieved = false;
        }
        // currentContext.maybePop();
        showNoDriverException(currentContext, details.status);
        return;
      }
      if (driverLat != null && driverLng != null) {
        final driverLocation = LatLng(driverLat, driverLng);
        await mapService.updateDriverLocation(driverLocation);
      }
      // 🔹 مرر التفاصيل للـQuickOrderController
      await ref
          .read(quickOrderControllerProvider.notifier)
          .setNewOrderDetails(details);
      debugPrint('$_TAG forwarded details to QuickOrderController');
      // 🔹 حدث حالة الجلسة
      state = (state as OrderActive).copyWith(status: status, details: details);
      if (
          status != OrderStatus.noDriverFound &&
          status == OrderStatus.accepted &&
          (details.driverData?.driverId != null)) {
        // state=AsyncData(state.copyWithPrevious(state.value.orderModel))
        // if (currentContext != null) {
        // ? Here where open widgets and close previous opened widgets when order is start
        await ref
            .read(homeServiceProvider.notifier)
            .resetLayers(currentContext);
        // } // ensure layers reset
      ref.read(paymentControllerProvider.notifier).resetPayment();

        _hasResetLayersAndOpenedSheet = true;
      }

      // 🔹 نفذ الهاندلر
      if (_previousStatus != status?.name) {
        _previousStatus = status?.name;
      }

      await _handleStatusChange(status, details, currentContext);
    }

    void onChat(dynamic data) {
      debugPrint('$_TAG onChat: ${data.runtimeType}');
      if (data is List) {
        final messages = List<Map<String, dynamic>>.from(data);
        ref
            .read(chatControllerProvider.notifier)
            .handleIncomingMessages(messages);
      }
    }

    socket.on(orderId, onOrder);
    socket.on(SocketEvents.chatMessage, onChat);

    ref.onDispose(() {
      debugPrint('$_TAG onDispose: detaching handlers for $orderId');
      socket.off(orderId, onOrder);
      socket.off(SocketEvents.chatMessage, onChat);
      _listening = false;
      _detachAll();
    });
  }

  Future<void> startPriceOffer({required String orderId}) async {
    // if (_listening && state is OrderActive) return;
    debugPrint('$_TAG start: already active for $orderId, skip');

    final socket = ref.read(socketServiceProvider);
    // final user = ref.read(userDataProvider.notifier).userinformation;
    final appRouter = ref.watch(appRouterProvider);
    final currentContext = appRouter.navigatorKey.currentContext!;

    debugPrint('$_TAG start: socket.connect DONE');
    final mapService = ref.read(mapControllerProvider.notifier);

    state = OrderActive(orderId: orderId, socketConnected: true);
    _listening = true;

    void onOrder(dynamic data) async {
      bool isFirstRecieved = true;

      debugPrint('$_TAG onOrder($orderId) event: ${data.runtimeType}');
      debugPrint("🎛️ Received order details: $data");
      if (data == null) return;

      final details = QuickOrderDetailsModel.fromJson(data);
      final status = OrderStatusExtension.fromString(details.status);
      final driverId = details.driverData?.driverId;
      final driverLat = details.driverData?.lat;
      final driverLng = details.driverData?.lng;
      debugPrint(
        '$_TAG parsed: status=${status?.name} driverId=$driverId offers=${details.offers?.length}',
      );
      debugPrint('$_TAG onOrder: status=${status?.name}');
      // if (status == OrderStatus.noDriverFound ||
      //    ( details.driverData == null&&details.offers ==null)) {
      //   if (isFirstRecieved) {
      //     // socket.disconnect();
      //     isFirstRecieved = false;
      //   }
      //   // currentContext.maybePop();
      //   showNoDriverException(currentContext, details.status);
      //   return;
      // }
      if (driverLat != null && driverLng != null) {
        final driverLocation = LatLng(driverLat, driverLng);
        await mapService.updateDriverLocation(driverLocation);
      }
      // 🔹 مرر التفاصيل للـQuickOrderController
      await ref
          .read(quickOrderControllerProvider.notifier)
          .setNewOrderDetails(details);
      debugPrint('$_TAG forwarded details to QuickOrderController');
      // 🔹 حدث حالة الجلسة
      state = (state as OrderActive).copyWith(status: status, details: details);
      // if (!_hasResetLayersAndOpenedSheet &&
      //     status != OrderStatus.noDriverFound &&
      //    ( details.driverData?.driverId != null)) {
      //   // state=AsyncData(state.copyWithPrevious(state.value.orderModel))
      //   // if (currentContext != null) {
      //   // ? Here where open widgets and close previous opened widgets when order is start
      //     // await ref
      //     //     .read(homeServiceProvider.notifier)
      //     //     .resetLayers(currentContext);
      //   // } // ensure layers reset

      //   _hasResetLayersAndOpenedSheet = true;
      // }

      // 🔹 Handler
      if (_previousStatus != status?.name) {
        _previousStatus = status?.name;
      }

      await _handleStatusChange(status, details, currentContext);
    }

    void onChat(dynamic data) {
      debugPrint('$_TAG onChat: ${data.runtimeType}');
      if (data is List) {
        final messages = List<Map<String, dynamic>>.from(data);
        ref
            .read(chatControllerProvider.notifier)
            .handleIncomingMessages(messages);
      }
    }

    socket.on(orderId, onOrder);
    socket.on(SocketEvents.chatMessage, onChat);

    ref.onDispose(() {
      debugPrint('$_TAG onDispose: detaching handlers for $orderId');
      socket.off(orderId, onOrder);
      socket.off(SocketEvents.chatMessage, onChat);
      _listening = false;
      _detachAll();
    });
  }

  void leave() {
    debugPrint('$_TAG leave()');
    _detachAll();
    state = const OrderIdle();
  }

  void _detachAll() {
    debugPrint('$_TAG _detachAll: disconnect socket');
    final socket = ref.read(socketServiceProvider);
    if (_listening) {
      socket.disconnect();
      _listening = false;
    }
  }

  Future<void> showNoDriverException(
    BuildContext context,
    String? message,
  ) async {
    debugPrint('$_TAG showNoDriverException: $message');
    if (Navigator.canPop(context)) Navigator.pop(context);

    await showAutoClosingDialog(
      context,
      "${message?.tr() ?? "No available drivers."}\n${"try_again".tr(context: context)}",
    );
  }

  /// 🔥 هنا كل حالات الطلب
  Future<void> _handleStatusChange(
    OrderStatus? status,
    QuickOrderDetailsModel details,
    BuildContext context,
  ) async {
    final mapService = ref.read(mapControllerProvider.notifier);

    switch (status) {
      case OrderStatus.accepted:
        debugPrint("✅ Order Status: Accepted by driver");
        ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();

        await mapService.getPolylinePoints(fromUserToSource: true);
        break;

      case OrderStatus.driverOnTheWay:
        debugPrint("🚗 Driver is on the way");
        await mapService.getPolylinePoints(
          fromDriverToUser: true,
          fromUserToSource: false,
        );
        await mapService.getPolylineDriverToMePoints();
        if (_previousStatus != OrderStatus.driverOnTheWay.toString()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primary,
              content: Text(
                "driver_on_the_way".tr(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            snackBarAnimationStyle: AnimationStyle(
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
            ),
          );
        }
        break;

      case OrderStatus.driverArrived:
        debugPrint("📍 Driver Arrived");
        await mapService.getPolylinePoints(
          fromDriverToUser: true,
          fromUserToSource: false,
        );
        if (_previousStatus != OrderStatus.driverArrived.toString()) {
          showAutoClosingDialog(
            context,
            "driver_arrived".tr(),
            icon: Icon(Icons.check_circle, color: AppColors.green),
          );
        }
              break;

      case OrderStatus.onTrip:
        debugPrint("🚚 Trip in progress");
        await mapService.getPolylinePoints(
          fromDriverToUser: false,
          fromUserToSource: false,
        );
        if (_previousStatus != OrderStatus.onTrip.toString()) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("on_trip".tr())));
        }

        break;

      case OrderStatus.finished:
        debugPrint("🏁 Finished: reset UI");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.newRed,
            content: Text("finished_thank_you".tr()),
          ),
        );

        await showRateDriverDialog(context);
        _resetUI(false);

        break;

      case OrderStatus.cancelled:
        debugPrint("❌ Cancelled");

        _resetUI(true);
        await showCustomDialog(context: context, title: Text("order_canceled_by_driver".tr()),icon: Icon(Icons.info_outline, color: Colors.amber,),);
        break;

      case OrderStatus.noDriverFound:
        debugPrint("🚫 No driver found");
        break;

      default:
        break;
    }
  }

  void _resetUI(bool isCanceled) {
    final socket = ref.read(socketServiceProvider);

    ref.read(mapControllerProvider.notifier)
      ..changeOrderActiveStatus()
      ..resetPoints()
      ..updateLocation();
    if(isCanceled) {
      ref.read(quickOrderControllerProvider.notifier).resetOrderDetails();
      ref.read(priceOfferControllerProvider.notifier).resetOrderDetails();
      
    }
    // else{
   ref
        .read(hideLayersDuringOrderControllerProvider.notifier)
        .hideLayersDuringOrder();
    ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();

    // }
    ref.read(locationSearchControllerProvider.notifier).restoreSearchFields();
     
 
    ref.read(scanDriverQrControllerProvider.notifier).resetScannedValue();
    socket.disconnect();
  }
}
