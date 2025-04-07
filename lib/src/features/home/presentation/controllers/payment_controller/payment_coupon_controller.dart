import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_coupon_controller.g.dart';

@riverpod
class PaymentCouponController extends _$PaymentCouponController {
  @override
  PaymentState build(double totalCost) {
    return PaymentState(
      isCouponApplied: false,
      totalCost: totalCost,
      discountedCost: totalCost,
      couponCode: '',
    );
  }

  void applyCoupon(String coupon) {
    if (coupon.isNotEmpty) {
      state = state.copyWith(
        isCouponApplied: true,
        discountedCost: state.totalCost * 0.65, // Example: 35% discount
        couponCode: coupon,
      );
    }
  }

  void removeCoupon() {
    state = state.copyWith(
      isCouponApplied: false,
      discountedCost: state.totalCost,
      couponCode: '',
    );
  }
}

class PaymentState {
  final bool isCouponApplied;
  final double totalCost;
  final double discountedCost;
  final String couponCode;

  PaymentState({
    required this.isCouponApplied,
    required this.totalCost,
    required this.discountedCost,
    this.couponCode = '',
  });

  PaymentState copyWith({
    bool? isCouponApplied,
    double? discountedCost,
    String? couponCode,
  }) {
    return PaymentState(
      isCouponApplied: isCouponApplied ?? this.isCouponApplied,
      totalCost: this.totalCost,
      discountedCost: discountedCost ?? this.discountedCost,
      couponCode: couponCode ?? this.couponCode,
    );
  }
}
