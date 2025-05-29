import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_controller.g.dart';

@riverpod
class PaymentController extends _$PaymentController {
  @override
  Future<PaymentState> build() async {
    return PaymentState(
      selectedMethod: null,
      totalAmount: 35.0,
      paymentMethods: [
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

    // Show loading state
    state = const AsyncLoading();

    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    state = AsyncData(state.requireValue.copyWith(selectedMethod: null));
    // Navigate to success page
    showSuccessPayment(context: context);
    Future.delayed(Duration(seconds: 3), () {
      ref.read(homeServiceProvider.notifier).resetLayers(context);
      Navigator.pop(context);
      showRateDriverDialog(context);
    });
  }
}

class PaymentState {
  final PaymentMethod? selectedMethod;
  final double totalAmount;
  final List<PaymentMethod> paymentMethods;

  const PaymentState({
    this.selectedMethod,
    required this.totalAmount,
    required this.paymentMethods,
  });

  PaymentState copyWith({
    PaymentMethod? selectedMethod,
    double? totalAmount,
    List<PaymentMethod>? paymentMethods,
  }) {
    return PaymentState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }
}
