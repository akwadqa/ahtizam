import 'dart:async';
import 'dart:io';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/payment/data/repositories/payment_repository.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/features/payment/presentation/pages/payment_web_view.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_controller.g.dart';

@Riverpod(keepAlive: true)
class PaymentController extends _$PaymentController {
  PaymentState? _cachedState; // 👈 local in-memory cache

  @override
  Future<PaymentState> build() async {
    // If cached (user paid before, state restored)
    
  if (_cachedState != null && _cachedState!.isPaid) {      
    debugPrint("💾 Restoring cached payment state");
      return _cachedState!;
    }else{
      debugPrint("💾 initialState payment state");

    // Fresh build
    final orderInfo = await ref.read(quickOrderControllerProvider.future);
    final initialState = PaymentState(
      selectedMethod: null,
      totalAmount: orderInfo?.orderModel?.finalFee ?? 0,
      baseAmount: orderInfo?.orderModel?.baseFee ?? 0,
      discountAmount: orderInfo?.orderModel?.discountCost ?? 0,
      taxFee: orderInfo?.orderModel?.taxFee ?? 0,
      paymentMethods: [
        if (Platform.isIOS)
          PaymentMethod(
            id: 'apple_pay',
            icon: 'assets/icons/apple_ic.svg',
            title: 'Apple Pay',
          ),
        PaymentMethod(
          id: 'credit_card',
          icon: 'assets/icons/credit_card_ic.svg',
          title: 'Credit Card',
        ),
        PaymentMethod(
          id: 'wallet',
          icon: 'assets/icons/wallet_ic.svg',
          title: 'Wallet',
        ),
        PaymentMethod(
          id: 'cash',
          icon: 'assets/icons/cash2_ic.svg',
          title: 'cash',
        ),
        if (Platform.isAndroid)
          PaymentMethod(
            id: 'google_pay',
            icon: 'assets/icons/google_ic.svg',
            title: 'Google Pay',
          ),
      ],
    );

    _cachedState = initialState;
    return initialState;}
  }

  void selectPaymentMethod(PaymentMethod method) {
    final newState = state.requireValue.copyWith(selectedMethod: method);
    _cachedState = newState;
    state = AsyncData(newState);
  }

  void isOrderPaied() {
    final newState = state.requireValue.copyWith(isPaid: true);
    _cachedState = newState;
    state = AsyncData(newState);
  }

  void clearSelectedMethod() {
    final newState = state.requireValue.copyWith(selectedMethod: null);
    _cachedState = newState;
    state = AsyncData(newState);
  }

  Future<void> processPayment(BuildContext context) async {
    if (state.requireValue.selectedMethod == null) return;

    try {
      state = const AsyncLoading();

      final orderData = await ref.read(quickOrderControllerProvider.future);
      if (!ref.mounted) return; // <--- ✅ guard after await

      final lang = ref.read(currentLanguageProvider);
      final paymentRepo = ref.read(paymentRepositoryProvider);

      final orderId = orderData?.orderModel?.quickOrderId;
      if (orderId == null) throw "Missing order ID";

      bool completed = false;
      final method = state.requireValue.selectedMethod!.id;

      switch (method) {
        case "wallet":
          completed = await _payWithWallet(
            paymentRepo: paymentRepo,
            context: context,
            orderId: orderId,
          );
          break;
        case "credit_card":
        case "apple_pay":
        case "google_pay":
          completed = await _payWithCard(
            context: context,
            paymentRepo: paymentRepo,
            orderId: orderId,
            lang: lang,
          );
          break;
        case "cash":
          completed = true;
          break;
        default:
          throw "Unsupported payment method";
      }

      if (!ref.mounted) return; // ✅ guard before touching state

      if (!completed) {

        if (context.mounted&&method!="wallet") showErrorDialog(context, "payment_cancelled".tr());
        state = AsyncData(state.value!);
        return;
      }

      await _completePaymentFlow(context);
    } catch (e, st) {
      debugPrint("❌ PaymentController error: $e");

      if (!ref.mounted) return; // ✅ guard again

      if (context.mounted) {
        if (e is WalletPaymentException && e.isInsufficient) {
          showWalletRechargeDialog(context, e.message);
        } else {
          showErrorDialog(
            context,
            e.toString().replaceFirst("Exception: ", ""),
          );
        }
      }

      state = AsyncError(e, st);
    }
  }

  Future<bool> _payWithWallet({
  required PaymentRepository paymentRepo,
  required String orderId,
  required BuildContext context,
}) async {
  final result = await paymentRepo.payByWallet(orderId: orderId);

  if (result.hasSucceeded) {
    return true;
  } else {
    final message = result.message ?? "Wallet payment failed";

    if (message.toLowerCase().contains("insufficient")) {
      // ✅ Show your small dialog
      showWalletRechargeDialog(context, message);

      // ✅ Reset to normal (no error)
      state = AsyncData(state.value!);

      // ✅ Stop further processing (no throw)
      return false;
    }

    // ❌ For other errors, you can still throw if needed
    throw WalletPaymentException.general(message);
  }
}


  Future<bool> _payWithCard({
    required BuildContext context,
    required PaymentRepository paymentRepo,
    required String orderId,
    required String lang,
  }) async {
    final response = await paymentRepo.getPaymentUrl(
      orderId: orderId,
      language: lang,
    );
    final url = response.data;
    if (url == null) throw "Failed to get payment link";

    if (context.mounted && Navigator.of(context).canPop()) {
      Navigator.pop(context);
    }

    final completer = Completer<bool>();

    if (!context.mounted) return false;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentWebViewPage(
          redirectUrl: url,
          onResult: (success) {
            if (!completer.isCompleted) completer.complete(success);
          },
        ),
      ),
    );

    if (!completer.isCompleted) completer.complete(result == true);
    return completer.future;
  }

  // void isOrderPaied() {
  //   state = AsyncData(state.requireValue.copyWith(isPaid: true));
  // }

  Future<void> _completePaymentFlow(BuildContext context) async {
    await ref
        .read(mapControllerProvider.notifier)
        .moveCameraToIncludeRoute(fromUserToSource: true);
    await Future.delayed(const Duration(milliseconds: 500));
    await ref.read(mapControllerProvider.notifier).captureScreenshot();
    if (state.requireValue.selectedMethod!.id != "cash") {
      state = AsyncData(state.requireValue.copyWith(isPaid: true));
      isOrderPaied();

      showSuccessPayment(context: context);
      state = AsyncData(state.value!);

      // Optional delay before closing dialog
      await Future.delayed(const Duration(seconds: 2));

      if (Navigator.of(context).canPop()) {
        Navigator.pop(context); // Close success dialog
      }
    }
    state = AsyncData(state.value!);

    final isDriverKnown =
        ref.read(scanDriverQrControllerProvider).value?.scanned ?? false;
    final orderType = ref
        .watch(showOrderFormControllerProvider.notifier)
        .initiallValue;
    final bool isPriceOfferOrder = orderType != "request_now";
    if (isDriverKnown || isPriceOfferOrder) {
      // ✅ Show a different loading or skip entirely
      showCustomConnectingToDriverDialog(context); // 👈 your own UI
    } else {
      showSearchingTruckLoading(context: context); // ⛔ normal truck search
    }
    // Start driver search and socket communication
    // showSearchingTruckLoading(context: context);

    final methodId = state.requireValue.selectedMethod!.id;

    try {
      await ref
          .read(quickOrderControllerProvider.notifier)
          .processAndStartSession(context, paymentMethod: methodId);
    } catch (e) {
      final errorText = e.toString().toLowerCase();

      // 👇 Detect "no driver" case from backend message
      if (errorText.contains("no available drivers") ||
          errorText.contains("no driver found")) {
        debugPrint("⚠️ No driver found after payment");

        // Mark payment successful, but driver not found
        state = AsyncData(state.requireValue.copyWith(isPaid: true));

        Future.microtask(() {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("no_driver_found_title".tr()),
              content: Text("payment_done_but_no_driver".tr()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    retryWithoutPayment(context);
                  },
                  child: Text("try_again".tr()),
                ),
              ],
            ),
          );
        });
      } else {
        state = AsyncError(e, StackTrace.current);
      }
    }
  }

  Future<void> processOrder(BuildContext context) async {
    await ref
        .read(mapControllerProvider.notifier)
        .moveCameraToIncludeRoute(fromUserToSource: true);
    await Future.delayed(const Duration(milliseconds: 500));
    await ref.read(mapControllerProvider.notifier).captureScreenshot();

    final isDriverKnown =
        ref.read(scanDriverQrControllerProvider).value?.scanned ?? false;
    if (isDriverKnown) {
      // ✅ Show a different loading or skip entirely
      showCustomConnectingToDriverDialog(context); // 👈 your own UI
    } else {
      showSearchingTruckLoading(context: context); // ⛔ normal truck search
    }

    final methodId = state.requireValue.selectedMethod?.id;

    try {
      await ref
          .read(quickOrderControllerProvider.notifier)
          .processAndStartSession(context, paymentMethod: methodId);
    } catch (e) {
      // state = AsyncError(e, StackTrace.current);
    }
  }

  void resetPayment() {
    _cachedState = null;
    // state = const AsyncLoading();

    // Force rebuild to initial state
    ref.invalidateSelf();
  }

  void retryWithoutPayment(BuildContext context) async {
    final methodId = state.requireValue.selectedMethod?.id;
    if (methodId == null) return;

    final isDriverKnown =
        ref.read(scanDriverQrControllerProvider).value?.scanned ?? false;
    if (isDriverKnown) {
      // ✅ Show a different loading or skip entirely
      showCustomConnectingToDriverDialog(
        context,
      ); // 👈 your specific truck driver
    } else {
      showSearchingTruckLoading(context: context); // ⛔ normal truck search
    }
    await ref
        .read(quickOrderControllerProvider.notifier)
        .processAndStartSession(context, paymentMethod: methodId);
  }
}

class PaymentState {
  final PaymentMethod? selectedMethod;
  final double totalAmount;
  final double baseAmount;
  final double? discountAmount;
  final double taxFee;
  final bool isPaid;
  final List<PaymentMethod> paymentMethods;

  const PaymentState({
    this.selectedMethod,
    required this.totalAmount,
    required this.baseAmount,
    this.discountAmount,
    required this.taxFee,
    this.isPaid = false, // 👈 default false

    required this.paymentMethods,
  });

  PaymentState copyWith({
    PaymentMethod? selectedMethod,
    double? totalAmount,
    double? baseAmount,
    double? discountAmount,
    double? taxFee,
    bool? isPaid,
    List<PaymentMethod>? paymentMethods,
  }) {
    return PaymentState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      totalAmount: totalAmount ?? this.totalAmount,
      baseAmount: baseAmount ?? this.baseAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      taxFee: taxFee ?? this.taxFee,
      isPaid: isPaid ?? this.isPaid, // 👈 assign

      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }
}
