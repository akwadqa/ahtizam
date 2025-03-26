import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_controller.g.dart';

@riverpod
class PaymentController extends _$PaymentController {
  @override
  PaymentState build() {
    return const PaymentState(
      selectedMethod: null,
      totalAmount: 35.0,
      paymentMethods: [
        PaymentMethod(
          id: 'google_pay',
          icon: 'assets/icons/google_ic.svg',
          title: 'Google Pay',
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
          id: 'apple_pay',
          icon: 'assets/icons/apple_ic.svg',
          title: 'Apple Pay',
        ),
      ],
    );
  }

  void selectPaymentMethod(PaymentMethod method) {
    state = state.copyWith(selectedMethod: method);
  }

  void clearSelectedMethod() {
    state = state.copyWith(selectedMethod: null);
  }

  Future<void> processPayment() async {
    if (state.selectedMethod == null) return;
    
    // TODO: Implement payment processing logic
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
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