import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/show_map_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/order_details_form/order_types_drop_down_widget.dart';
import 'package:ahtizam/src/features/rating/data/repository/rating_repository.dart';
import 'package:ahtizam/src/features/rating/domain/rating_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rate_controller.g.dart';

enum RatingOption {
  excellent(5, "excellent"),
  veryGoof(4, "very_good"),
  good(3, "good"),
  normal(2, "normal"),
  bad(1, "bad");

  final int value;
  final String label;
  const RatingOption(this.value, this.label);
}

class RateState {
  final RatingOption? selectedRating;
  final String? comment;
  final bool isLoading;
  final bool isError;
  final String? message;
  final bool success;

  const RateState({
    this.selectedRating,
    this.comment,
    this.isError = false,
    this.isLoading = false,
    this.success = false,
    this.message,
  });

  RateState copyWith({
    RatingOption? selectedRating,
    String? comment,
    bool? isLoading,
    bool? isError,
    bool? success,
    String? message,
  }) {
    return RateState(
      selectedRating: selectedRating ?? this.selectedRating,
      comment: comment ?? this.comment,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      message: message,
    );
  }
}

@riverpod
class RateController extends _$RateController {
  @override
  RateState build() {
    return const RateState();
  }

  void selectRating(RatingOption rating) {
    state = state.copyWith(selectedRating: rating);
  }

  void updateComment(String comment) {
    state = state.copyWith(comment: comment);
  }

  Future<void> submitRating() async {
    if (state.selectedRating == null) {
      state = state.copyWith(message: 'الرجاء اختيار تقييم', isError: true);
      return;
    }

    state = state.copyWith(isLoading: true, message: '');

    try {
      final orderInfo = ref.watch(quickOrderControllerProvider).value;
      debugPrint("orderInfo: ${orderInfo?.orderDetails?.driverData?.driverId}");
      debugPrint("orderInfo: ${orderInfo?.orderDetails}");
      debugPrint("orderInfo: ${orderInfo?.orderModel?.quickOrderId}");
      final orderType =
          ref.watch(showOrderFormControllerProvider.notifier).initiallValue;
      final ratingParams = RatingParams(
        driverId:
            // "12345",
            orderInfo?.orderDetails?.driverData?.driverId ?? "No drive Id",
        rating: state.selectedRating!.value.toString(),
        referenceDoctype:
            orderType == "request_now" ? "Quick Order" : "Order Offer",
        referenceName:
            // "35s67cuvy",
            orderInfo?.orderModel?.quickOrderId,
        comment:
            (state.comment?.trim().isNotEmpty ?? false) ? state.comment : null,
      );
      debugPrint(ratingParams.toString());

      final result =
          await ref.read(ratingRepositoryProvider).ratingDriver(ratingParams);
      if (result.hasSucceeded) {
        debugPrint(result.message);
        // ref.read(showMapControllerProvider.notifier).toggleSelection();
        ref.read(quickOrderControllerProvider.notifier).resetOrderDetails();
              // ref.read(mapControllerProvider.notifier)
              // ..resetPoints()
              // ..updateLocation();
              
      }
      state = state.copyWith(
          isLoading: false, success: true, message: result.message);
      // return success.isSuccess; // Adjust this based on your ApiResponse type
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
        message: 'حدث خطأ أثناء إرسال التقييم',
      );
      // return false;
    }
  }

  // Future<bool> submitRating() async {
  //   if (state.selectedRating == null) {
  //     state = state.copyWith(error: 'الرجاء اختيار تقييم');
  //     return false;
  //   }

  //   state = state.copyWith(isLoading: true, error: null);

  //   try {
  //     await Future.delayed(const Duration(seconds: 1)); // Simulate API call

  //     state = state.copyWith(isLoading: false);
  //     return true;
  //   } catch (e) {
  //     state = state.copyWith(
  //       isLoading: false,
  //       error: 'حدث خطأ أثناء إرسال التقييم',
  //     );
  //     return false;
  //   }
  // }

  void clearError() {
    state = state.copyWith(message: null);
  }
}
