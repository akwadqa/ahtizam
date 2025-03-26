import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/payment_controller.dart';
import '../widgets/empty_card_section.dart';
import '../widgets/payment_bottom_section.dart';
import '../widgets/payment_methods_list.dart';

@RoutePage()
class PaymentMethodPage extends ConsumerWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(paymentControllerProvider);
    final paymentController = ref.read(paymentControllerProvider.notifier);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "payment_information"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PaymentMethodsList(
            paymentMethods: paymentState.paymentMethods,
            selectedMethod: paymentState.selectedMethod,
            onMethodSelected: (method) {
              paymentController.selectPaymentMethod(method);
            },
          ),
          40.verticalSpace,
          if (paymentState.selectedMethod?.id == 'credit_card')
            EmptyCardsSection(
              onAddCard: () {
                context.pushRoute(const AddCardRoute());
              },
            ),
          const Spacer(),
          PaymentBottomSection(
            totalAmount: paymentState.totalAmount,
            selectedMethod: paymentState.selectedMethod?.id,
            onPay: () {
              if (paymentState.selectedMethod != null) {
                paymentController.processPayment();
              }
            },
          ),
        ],
      ),
    );
  }
}
