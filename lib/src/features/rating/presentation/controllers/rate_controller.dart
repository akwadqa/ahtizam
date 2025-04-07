import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rate_controller.g.dart';

enum RatingOption {
  excellent(5, "excellent"),
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
  final String? error;

  const RateState({
    this.selectedRating,
    this.comment,
    this.isLoading = false,
    this.error,
  });

  RateState copyWith({
    RatingOption? selectedRating,
    String? comment,
    bool? isLoading,
    String? error,
  }) {
    return RateState(
      selectedRating: selectedRating ?? this.selectedRating,
      comment: comment ?? this.comment,
      isLoading: isLoading ?? this.isLoading,
      error: error,
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

  Future<bool> submitRating() async {
    if (state.selectedRating == null) {
      state = state.copyWith(error: 'الرجاء اختيار تقييم');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: Implement API call here
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'حدث خطأ أثناء إرسال التقييم',
      );
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
