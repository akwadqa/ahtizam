import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_card_controller.g.dart';

@riverpod
class AddCardController extends _$AddCardController {
  late final TextEditingController cardHolderController;
  late final TextEditingController cardNumberController;
  late final TextEditingController expiryDateController;
  late final TextEditingController cvcController;
  late final GlobalKey<FormState> formKey;

  @override
  AddCardState build() {
    cardHolderController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvcController = TextEditingController();
    formKey = GlobalKey<FormState>();

    // // Add listeners to update state
    // cardHolderController.addListener(() {
    //   updateCardHolderName(cardHolderController.text);
    // });
    // cardNumberController.addListener(() {
    //   updateCardNumber(cardNumberController.text);
    // });
    // expiryDateController.addListener(() {
    //   updateExpiryDate(expiryDateController.text);
    // });
    // cvcController.addListener(() {
    //   updateCvc(cvcController.text);
    // });

    return const AddCardState(
      isLoading: false,
      error: null,
    );
  }

  // @override
  // void dispose() {
  //   cardHolderController.dispose();
  //   cardNumberController.dispose();
  //   expiryDateController.dispose();
  //   cvcController.dispose();
  //   super.dispose();
  // }

  // void updateCardHolderName(String name) {
  //   state = state.copyWith(
  //     cardDetails: (state.cardDetails ??
  //             CardDetails(
  //               cardHolderName: '',
  //               cardNumber: '',
  //               expiryDate: '',
  //               cvc: '',
  //             ))
  //         .copyWith(cardHolderName: name),
  //   );
  // }

  // void updateCardNumber(String number) {
  //   state = state.copyWith(
  //     cardDetails: (state.cardDetails ??
  //             CardDetails(
  //               cardHolderName: '',
  //               cardNumber: '',
  //               expiryDate: '',
  //               cvc: '',
  //             ))
  //         .copyWith(cardNumber: number),
  //   );
  // }

  // void updateExpiryDate(String date) {
  //   state = state.copyWith(
  //     cardDetails: (state.cardDetails ??
  //             CardDetails(
  //               cardHolderName: '',
  //               cardNumber: '',
  //               expiryDate: '',
  //               cvc: '',
  //             ))
  //         .copyWith(expiryDate: date),
  //   );
  // }

  // void updateCvc(String cvc) {
  //   state = state.copyWith(
  //     cardDetails: (state.cardDetails ??
  //             CardDetails(
  //               cardHolderName: '',
  //               cardNumber: '',
  //               expiryDate: '',
  //               cvc: '',
  //             ))
  //         .copyWith(cvc: cvc),
  //   );
  // }

  Future<bool> saveCard() async {
    if (!formKey.currentState!.validate()) return false;
    // if (state.cardDetails == null) return false;

    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: Implement API call to save card
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void resetForm() {
    cardHolderController.clear();
    cardNumberController.clear();
    expiryDateController.clear();
    cvcController.clear();
    formKey.currentState?.reset();
  }
}

class AddCardState {
  final bool isLoading;
  final String? error;

  const AddCardState({
    required this.isLoading,
    this.error,
  });

  AddCardState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return AddCardState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
