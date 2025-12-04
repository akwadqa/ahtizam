import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/domain/models/order/driver_quick_order_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/order_session_controller.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/price_offer_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';

part 'quick_order_controller.g.dart';

class OrderState {
  final QuickOrderDetailsModel? orderDetails;
  final QuickOrderModel? orderModel;

  const OrderState({this.orderDetails, this.orderModel});

  OrderState copyWith({
    QuickOrderDetailsModel? orderDetails,
    QuickOrderModel? orderModel,
  }) {
    return OrderState(
      orderDetails: orderDetails ?? this.orderDetails,
      orderModel: orderModel ?? this.orderModel,
    );
  }
}

@Riverpod(keepAlive: true)
class QuickOrderController extends _$QuickOrderController {
  static const _TAG = '[QO]';

  QuickOrderModel? _processedModel;

  @override
  FutureOr<OrderState?> build() => null;

  // -----------------------
  // Helpers (state setters)
  // -----------------------
  void setQuickOrderModel(QuickOrderModel? model) {
    final cur = state.value;
    debugPrint('$_TAG setQuickOrderModel: id=${model?.quickOrderId}');
    state = AsyncData(
      OrderState(orderModel: model, orderDetails: cur?.orderDetails),
    );
  }

  Future<void> setNewOrderDetails(QuickOrderDetailsModel? details) async {
    if (details == null) return;
    final cur = state.value;
    debugPrint(
      '$_TAG setNewOrderDetails: status=${details.status} driverId=${details.driverData?.driverId} offers=${details.offers?.length}',
    );
    if (cur == null) {
      state = AsyncData(
        OrderState(orderModel: _processedModel, orderDetails: details),
      );
      return;
    }
    state = AsyncData(cur.copyWith(orderDetails: details));
  }

  void resetOrderDetails() {
    debugPrint('$_TAG resetOrderDetails');
    state = const AsyncData(null);
    _processedModel = null;
  }

  // -----------------------
  // Create Order
  // -----------------------
  Future<QuickOrderModel?> createOrder({String? couponCode}) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(homeRepositoryProvider);
      final user = ref.read(userDataProvider.notifier).userinformation;
      final coords = ref
          .read(locationSearchControllerProvider.notifier)
          .sendCoordinates();
      final serviceType = ref.read(
        selectServiceTypeControllerProvider,
      ); // لو عندك بروفايدر
      final orderType = ref
          .read(showOrderFormControllerProvider.notifier)
          .initiallValue;

      if (coords == null) {
        state = AsyncError('Invalid coordinates', StackTrace.current);
        return null;
      }

      debugPrint(
        '$_TAG createOrder: type=$orderType email=${user.email} '
        'from=(${coords[0].lat},${coords[0].lng}) to=(${coords[1].lat},${coords[1].lng}) '
        'service=${serviceType.value?.selectedServiceType?.serviceId}',
      );

      final resp = await repo.createQuickOrder(
        orderType: orderType == "request_now" ? 0 : 1,
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

      if (resp.hasFailed || (resp.data?.quickOrderId.isEmpty ?? true)) {
        throw Exception(resp.message ?? 'create order failed');
      }

      state = AsyncData(OrderState(orderModel: resp.data));
      debugPrint('$_TAG createOrder DONE: id=${resp.data?.quickOrderId}');
      return resp.data;
    } catch (e, st) {
      debugPrint('$_TAG createOrder ERROR: $e');
      state = AsyncError(e, st);
      return null;
    }
  }

  // ------------------------------------------------
  // Process + Start Session (Quick OR Price Offer)
  // ------------------------------------------------
  Future<void> processAndStartSession(
    BuildContext context, {
    String? paymentMethod, // يُستخدم فقط في quick (request_now)
  }) async {
    final repo = ref.read(homeRepositoryProvider);
    final user = ref.read(userDataProvider.notifier).userinformation;
    final mapShot = ref.read(mapControllerProvider.notifier).mapScreenshotFile;

    final orderModel = state.value?.orderModel;
    final orderType = ref
        .read(showOrderFormControllerProvider.notifier)
        .initiallValue;
    final isOfferPrice = orderType != "request_now";

    // Price Offer: نقرأ الإختيار
    final selectedOffer = ref
        .read(priceOfferControllerProvider)
        .value
        ?.selectedOffer;

    // QR driver (في quick أو offer)
    String? driverId = ref.read(scanDriverQrControllerProvider).value?.driverId;
    if (isOfferPrice) {
      // في offer: نعتمد على العرض المقبول
      driverId = selectedOffer?.driverId;
    }

    if (orderModel == null) {
      debugPrint('$_TAG process: no orderModel!');
      state = AsyncError('Missing order model', StackTrace.current);
      return;
    }

    debugPrint(
      '$_TAG process: orderId=${orderModel.quickOrderId} '
      'type=$orderType isOffer=$isOfferPrice driverId=$driverId '
      'offerId=${selectedOffer?.quickOrderOfferId} payment=$paymentMethod',
    );

    final orderResponse = await repo.processQuickOrder(
      orderType: isOfferPrice ? 1 : 0,
      quickOrderId: orderModel.quickOrderId,
      quickOrderOfferId: isOfferPrice ? selectedOffer?.quickOrderOfferId : null,
      driverId: driverId,
      onlyUpdatePayment:
          isOfferPrice && selectedOffer != null, // لو انت عاملها كده
      paymentMethod: isOfferPrice ? null : paymentMethod,
      mapImage: mapShot,
    );

    debugPrint(
      '$_TAG process orderResponse: error=${orderResponse.error} msg=${orderResponse.message} data=${orderResponse.data?.quickOrderId}',
    );
    if (orderResponse.error == 1 || orderResponse.data == null) {
      // UI هيتصرف عبر الـlistener (أو تقدر تستدعي Dialog هنا لو تحب)
      showNoDriverException(context, orderResponse.message);
      return;
    }

    _processedModel = orderResponse.data!;
    setQuickOrderModel(_processedModel); // حدّث الموديل محليًا

    if (isOfferPrice && paymentMethod == null) {
      debugPrint('$_TAG process: isOfferPrice');

      // 👇 لسه منتظر عروض
      await _handlePriceOfferOrder(
        orderResponse.data!.quickOrderId,
        user.token,
        context,
      );
    } else if (isOfferPrice) {
      // 👇 بعد الدفع: افتح Driver UI وابدأ socket للـ price offer
      debugPrint('$_TAG process: isOfferPrice2');
      // Navigator.of(context).pop();

      await ref.read(homeServiceProvider.notifier).resetLayers(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      final session = ref.read(orderSessionControllerProvider.notifier);
      await session.startPriceOffer(orderId: orderModel.quickOrderId);
    } else {
      // 👇 Quick order
      final session = ref.read(orderSessionControllerProvider.notifier);
      await session.start(orderId: orderModel.quickOrderId);
      debugPrint('$_TAG process: session.start DONE');
    }
  }

  // ---------------------------------
  // Rehydrate from existing order
  // ---------------------------------
  Future<void> rehydrateOrder(
    MyOrderDetailsModel orderModel,
    BuildContext context,
  ) async {
    debugPrint(
      '$_TAG rehydrateOrder: id=${orderModel.quickOrderId} status=${orderModel.status}',
    );
    // ابنِ details من MyOrderDetailsModel (زي ما كنت عامل)
    final rehydrated = QuickOrderDetailsModel(
      status: orderModel.status,
      driverData: DriverQuickOrderModel(
        driverId: orderModel.driverDetails.assignedDriver,
        driverEmail: orderModel.driverDetails.assignedDriver,
        status: orderModel.status,
        available: 1,
        name: orderModel.driverDetails.fullName ?? "",
        image: orderModel.driverDetails.profileImage,
        phone: orderModel.driverDetails.driverPhone ?? "",
        vehicleType: orderModel.serviceType,
        vehiclePlateNumber: orderModel.driverDetails.assignedDriver,
        rate: orderModel.driverDetails.rating!.toDouble(),
        lat: orderModel.passengerLocation.latitude,
        lng: orderModel.passengerLocation.longitude,
        driverAddress: '',
      ),
      offers: null,
    );
    final current = state.value;
    state = AsyncData(
      OrderState(
        orderDetails: rehydrated,
        orderModel: current!.orderModel?.copyWith(
          quickOrderId: orderModel.quickOrderId,
        ),
      ),
    );
    await ref
        .read(orderSessionControllerProvider.notifier)
        .start(orderId: orderModel.quickOrderId);
    debugPrint('$_TAG rehydrateOrder: session started');
  }

  // ---------------------------------
  // Cancel Order
  // ---------------------------------
  Future<bool> cancelOrder({required BuildContext context}) async {
    final cur = state.value;
    if (cur?.orderModel == null) return false;

    state = const AsyncLoading();
    try {
      final result = await ref
          .read(homeRepositoryProvider)
          .cancelOrder(orderId: cur!.orderModel!.quickOrderId);

      if (result.hasFailed) {
        showAutoClosingDialog(context, result.message ?? "حدث خطأ");
        state = AsyncData(cur); // ارجع الحالة
        return false;
      }

      // نظف الجلسة + الحالة
      ref.read(orderSessionControllerProvider.notifier).leave();
      resetOrderDetails();

      // نظف الخريطة/الطبقات حسب منطقك
      ref.read(mapControllerProvider.notifier)
        ..changeOrderActiveStatus()
        ..resetPoints()
        ..updateLocation();
      ref.read(locationSearchControllerProvider.notifier).restoreSearchFields();

      ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();
      ref
          .read(hideLayersDuringOrderControllerProvider.notifier)
          .hideLayersDuringOrder();
      Navigator.of(context).pop();

      // ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();

      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<void> _handlePriceOfferOrder(
    String quickOrderId,
    String token,
    BuildContext context,
  ) async {
    debugPrint("🎯 Handling price offer order: $quickOrderId");

    // Start the price offer controller
    final priceOfferController = ref.read(
      priceOfferControllerProvider.notifier,
    );
    await priceOfferController.startListeningForOffers(
      orderId: quickOrderId,
      context: context,
    );

    // Also listen for regular order updates in parallel
    // await _connectSocketAndListen(socketService, quickOrderId, token, context);
  }

  Future<void> showNoDriverException(
    BuildContext context,
    String? message,
  ) async {
    if (Navigator.canPop(context)) Navigator.pop(context);
    await showAutoClosingDialog(
      context,
      "${message ?? "No available drivers."}\n${"try_again".tr(context: context)}",
    );
  }
}

