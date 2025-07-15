import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_coupon_controller.g.dart';

@riverpod
class PaymentCouponController extends _$PaymentCouponController {
  @override
  FutureOr<PaymentState> build() {
    final orderState = ref.watch(quickOrderControllerProvider);
    debugPrint("Final fee ${orderState.value?.orderModel?.finalFee}");
    debugPrint("discountCost${ orderState.value?.orderModel?.discountCost}");

    return PaymentState(
      isCouponApplied: false,
      totalCost: orderState.value?.orderModel?.finalFee??0,
      baseCost: orderState.value?.orderModel?.baseFee??0,
      discountedCost: orderState.value?.orderModel?.discountCost??0,
      couponCode: '',
    );
  }

  Future<bool >applyCoupon(String coupon,BuildContext context)async {
    final orderState = ref.watch(quickOrderControllerProvider);
    if (coupon.isNotEmpty) {
  final result= await   ref
          .read(quickOrderControllerProvider.notifier)
          .createOrder(couponCode: coupon,);
      final currentState = state.value;
      if(result?.discountCost!=null) {
        state = AsyncData(currentState!.copyWith(
        isCouponApplied: true,
        discountedCost: orderState.value?.orderModel?.discountCost,
        couponCode: coupon,
      ));
      return true;
      }
      return false;
    }
      return false;

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
  final double? baseCost;
  final double? discountedCost;
  final String couponCode;

  PaymentState({
    required this.isCouponApplied,
    required this.totalCost,
    required this.baseCost,
    this.discountedCost,
    this.couponCode = '',
  });

  PaymentState copyWith({
    bool? isCouponApplied,
    double? discountedCost,
    double? baseCost,
    double? totalCost,
    String? couponCode,
  }) {
    return PaymentState(
      isCouponApplied: isCouponApplied ?? this.isCouponApplied,
      totalCost: this.totalCost,
      baseCost: this.baseCost,
      discountedCost: discountedCost ?? this.discountedCost,
      couponCode: couponCode ?? this.couponCode,
    );
  }
}
