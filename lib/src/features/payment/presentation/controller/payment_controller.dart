import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';
import 'package:ahtizam/src/features/payment/data/repositories/payment_repository.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/features/payment/presentation/pages/payment_web_view.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_controller.g.dart';

@riverpod
class PaymentController extends _$PaymentController {
  @override
  Future<PaymentState> build() async {
    final orderInfo=ref.watch(quickOrderControllerProvider);
    return PaymentState(
      selectedMethod: null,
      totalAmount: orderInfo.value!.orderModel!.finalFee,
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

  // Show loading dialog
  // showDialog(
  //   context: context,
  //   barrierDismissible: false,
  //   builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
  // );

  try {
    final orderData=ref.watch(quickOrderControllerProvider);
    final lang=ref.watch(currentLanguageProvider);
    final quickOrderId = orderData.requireValue?.orderModel?.quickOrderId;
    if (quickOrderId == null) throw "Missing order ID";

    // /// 1. Get payment URL from your backend
    // final response = await ref.read(paymentRepositoryProvider).getPaymentUrl(
    //   quickOrderId: quickOrderId,
    //   language: lang,
    // );

    // final url = response.data;
    // if (url == null) throw "Failed to get payment link";

    // // Close loading before opening payment page
    // if (Navigator.of(context).canPop()) Navigator.pop(context);

    // /// 2. Open the URL in browser or WebView and wait
    // final paymentCompleted = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => PaymentWebViewPage(redirectUrl: url),
    //   ),
    // );

    // /// 3. If user cancelled
    // if (paymentCompleted != true) {
    //   showErrorDialog(context, "Payment was not completed");
    //   return;
    // }

   

    /// 4. Payment succeeded → show success
    showSuccessPayment(context: context);
      await  ref.read(mapControllerProvider.notifier).captureScreenshot();

    await Future.delayed(const Duration(seconds: 3), () async{
      Navigator.pop(context); // Close success popup
    });

    /// 5. Start driver search (socket)
    showSearchingTruckLoading(context: context);
    await ref
        .read(quickOrderControllerProvider.notifier)
        .startOpenNewOrderSocket(context, showLoading: true,paymentMethod: state.requireValue.selectedMethod!.id);
  } catch (e) {
    debugPrint("ERRRROOOOOOOOR HERE ON FIRE PAYMENT CONTROLLER ");
    if (Navigator.of(context).canPop()) Navigator.pop(context);
    showErrorDialog(context, e.toString().replaceFirst("Exception: ", ""));
  }
}

// Future<void> processPayment(BuildContext context) async {
//   if (state.requireValue.selectedMethod == null) return;

//   // Show loading dialog
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
//   );

//   try {
//     // here need handle payment logic
    
//     showSuccessPayment(context: context);
//      await Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pop(context); // Close success dialog
//     });
//     // Start the order + socket logic

//     await ref
//         .read(quickOrderControllerProvider.notifier)
//         .startOpenNewOrderSocket(context, showLoading: true);

//     // Success flow

   

//     // showSearchingTruckLoading(context: context);
//   } catch (e) {
//     // Close loading dialog before showing error
//     if (Navigator.of(context).canPop()) Navigator.pop(context);

//     // Show popup with error message
//     showErrorDialog(context, e.toString());
//   }
// }

//  Future<void> startOpenNewOrderSocket(BuildContext context, ) async {
//     state = const AsyncLoading();

//   final homeRepo = ref.read(homeRepositoryProvider);
//   final socketService = ref.read(socketServiceProvider);
//   final driverData = ref.read(userDataProvider.notifier).userinformation;
//   final coordinates = ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
//   final currentOrder = ref.read(quickOrderControllerProvider).value?.orderModel;

//   if (currentOrder == null) {
//     debugPrint("❌ Unable to Open socket: no order model");
//     throw Exception("Unable to Open socket");
//   }

//   if (coordinates == null) {
//     state = AsyncError('Invalid coordinates', StackTrace.current);
//     return;
//   }

//   // Process the quick order
//   await homeRepo.processQuickOrder(
//     quickOrderId: currentOrder.quickOrderId
//   );

//   // Show truck loading dialog only if `showLoading` is true
//     await showSearchingTruckLoading(context: context);
  

//   // Connect to the socket
//   await socketService.connect(driverData.token).then((_) async {
//     debugPrint("🎛️ currentOrder.quickOrderId,: ${currentOrder.quickOrderId}");

//     socketService.on(currentOrder.quickOrderId, (data) {
//       debugPrint("🎛️ Received order details: $data");

//       if (data == null) return;

//       final result = QuickOrderDetailsModel.fromJson(data);

//       if (result.status == "No Driver Found" || result.driverData?.driverId == null) {
//         state = AsyncError("No Driver Found", StackTrace.current);
//         return;
//       }

//       // Update the state with the order details
//        ref.read(quickOrderControllerProvider.notifier).setNewOrderDetails(result);

//       // final current = state.value;
//       // state = AsyncData(
//       //   current?.copyWith(orderDetails: result) ?? OrderState(orderDetails: result),
//       // );

//       // Close loading dialog (if any)
//       // if (showLoading) {
//         // Navigator.of(context, rootNavigator: true).pop(); // Close loading
//       // }

//       // Show driver details bottom sheet
//       Future.microtask(() {
//         showDriverDetailsBottomSheet(context);
//       });
//     });
//   });
// }

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
