import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_coupon_controller.g.dart';

@riverpod
class PaymentCouponController extends _$PaymentCouponController {
  @override
  FutureOr<PaymentState> build() {
    final orderState = ref.watch(quickOrderControllerProvider);
    debugPrint("Final fee ${orderState.value!.orderModel!.finalFee}");
    debugPrint("discountCost${ orderState.value!.orderModel!.discountCost}");

    return PaymentState(
      isCouponApplied: false,
      totalCost: orderState.value!.orderModel!.finalFee,
      discountedCost: orderState.value!.orderModel!.discountCost,
      couponCode: '',
    );
  }

  Future<void >applyCoupon(String coupon,BuildContext context)async {
    final orderState = ref.watch(quickOrderControllerProvider);
    if (coupon.isNotEmpty) {
   await   ref
          .read(quickOrderControllerProvider.notifier)
          .createOrder(couponCode: coupon,);
      final currentState = state.value;
      state = AsyncData(currentState!.copyWith(
        isCouponApplied: true,
        discountedCost: orderState.value?.orderModel?.discountCost,
        couponCode: coupon,
      ));
    }
  }

  void removeCoupon() {
    final orderState = ref.watch(quickOrderControllerProvider);
      final currentState = state.value;
      state = AsyncData(currentState!.copyWith(
      isCouponApplied: false,
      discountedCost: orderState.value?.orderModel?.finalFee,
      couponCode: '',
      ));
   
  }
}

class PaymentState {
  final bool isCouponApplied;
  final double totalCost;
  final double? discountedCost;
  final String couponCode;

  PaymentState({
    required this.isCouponApplied,
    required this.totalCost,
    this.discountedCost,
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
