import 'dart:async';
import 'dart:io';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/payment/data/repositories/payment_repository.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/features/payment/presentation/pages/payment_web_view.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_controller.g.dart';
@riverpod
class PaymentController extends _$PaymentController {
  @override
  Future<PaymentState> build() async {
    //? This makes build() wait for the async state to be fully ready.
final orderInfo = await ref.watch(quickOrderControllerProvider.future);
    return PaymentState(
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
        if (Platform.isAndroid)
          PaymentMethod(
            id: 'google_pay',
            icon: 'assets/icons/google_ic.svg',
            title: 'Google Pay',
          ),
      ],
    );
  }

  void selectPaymentMethod(PaymentMethod method) {
    state = AsyncData(state.requireValue.copyWith(selectedMethod: method));
  }

  void clearSelectedMethod() {
    state = AsyncData(state.requireValue.copyWith(selectedMethod: null));
  }

  Future<void> processPayment(BuildContext context) async {
    if (state.requireValue.selectedMethod == null) return;

    // Show loading dialog
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
    // );

    try {
      state = AsyncLoading();

      final orderData = ref.watch(quickOrderControllerProvider);
      final lang = ref.watch(currentLanguageProvider);
      final orderId = orderData.requireValue?.orderModel?.quickOrderId;
      final paymentRepo = ref.read(paymentRepositoryProvider);

      if (orderId == null) throw "Missing order ID";

      switch (state.requireValue.selectedMethod!.id) {
        case "wallet":
          await _payWithWallet(paymentRepo: paymentRepo, orderId: orderId);
          break;

        case "credit_card":
          final completed = await _payWithCard(
            context: context,
            paymentRepo: paymentRepo,
            orderId: orderId,
            lang: lang,
          );

          if (!completed) {
            state = AsyncData(state.value!); // Reset state so UI updates
            showErrorDialog(context, "payment_cancelled".tr());
            return;
          }
          break;

        default:
          throw "Unsupported payment method";
      }

      await _completePaymentFlow(context);
    } catch (e) {
      debugPrint("ERRRROOOOOOOOR HERE ON FIRE PAYMENT CONTROLLER: $e");

      if (e is WalletPaymentException && e.isInsufficient) {
        state = AsyncData(state.value!);
        showWalletRechargeDialog(context, e.message);
      } else {
        showErrorDialog(context, e.toString().replaceFirst("Exception: ", ""));
        state = AsyncError(e, StackTrace.current);
      }
    }
  }

  Future<bool> _payWithWallet({
    required PaymentRepository paymentRepo,
    required String orderId,
  }) async {
    final result = await paymentRepo.payByWallet(orderId: orderId);
    if (result.hasSucceeded) {
      return true;
    } else {
      if ((result.message ?? "").toLowerCase().contains("insufficient")) {
        throw WalletPaymentException.insufficientBalance(result.message!);
      }
      throw WalletPaymentException.general(
          result.message ?? "Wallet payment failed");
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

    // Don't pop loading here if not open
    // if (Navigator.of(context).canPop()) Navigator.pop(context);

    // Use a Completer to ensure you handle response once
    final completer = Completer<bool>();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentWebViewPage(
          redirectUrl: url,
          onResult: (success) {
            if (!completer.isCompleted) {
              completer.complete(success);
            }
          },
        ),
      ),
    );

    // In case onResult wasn't triggered (e.g., user backs out)
    if (!completer.isCompleted) {
      completer.complete(result == true);
    }

    return completer.future;
  }

  void isOrderPaied() {
    state = AsyncData(state.requireValue.copyWith(isPaid: true));
  }

  Future<void> _completePaymentFlow(BuildContext context) async {

    await ref.read(mapControllerProvider.notifier).moveCameraToIncludeRoute(
    fromUserToSource: true,
    );
    await Future.delayed(const Duration(milliseconds: 500));
    await ref.read(mapControllerProvider.notifier).captureScreenshot();

    state = AsyncData(state.requireValue.copyWith(isPaid: true));

    showSuccessPayment(context: context);
    state = AsyncData(state.value!);

    // Optional delay before closing dialog
    await Future.delayed(const Duration(seconds: 2));

    if (Navigator.of(context).canPop()) {
      Navigator.pop(context); // Close success dialog
    }
    final isDriverKnown =
        ref.read(scanDriverQrControllerProvider).value?.scanned ?? false;
    if (isDriverKnown) {
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
          .startOpenNewOrderSocket(
            context,
            paymentMethod: methodId,
          );
    } catch (e) {
      // 👇 Catch "No driver" and set flag
      // if (e.toString().contains("No available drivers")) {
      //   state = AsyncData(state.requireValue.copyWith(noDriverFound: true));
      // } else {
      state = AsyncError(e, StackTrace.current);
      // await Future.delayed(const Duration(seconds: 2)).then((_) {
      //   // if (Navigator.of(context).canPop()) Navigator.pop(context);
      // });
      // }
    }
  }

  void retryWithoutPayment(BuildContext context) async {
    final methodId = state.requireValue.selectedMethod?.id;
    if (methodId == null) return;

    final isDriverKnown =
        ref.read(scanDriverQrControllerProvider).value?.scanned ?? false;
    if (isDriverKnown) {
      // ✅ Show a different loading or skip entirely
      showCustomConnectingToDriverDialog(context); // 👈 your specific truck driver
    } else {
      showSearchingTruckLoading(context: context); // ⛔ normal truck search
    }
    await ref
        .read(quickOrderControllerProvider.notifier)
        .startOpenNewOrderSocket(
          context,
          paymentMethod: methodId,
        );
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
