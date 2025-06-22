import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/payment_controller.dart';
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
      body: paymentState.when(
        data: (state) =>
            _buildPaymentContent(context, ref, state, paymentController),
        loading: () => const Center(child: FadeCircleLoadingIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildPaymentContent(BuildContext context, WidgetRef ref,
      PaymentState state, PaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PaymentMethodsList(
          paymentMethods: state.paymentMethods,
          selectedMethod: state.selectedMethod,
          onMethodSelected: (method) {
            controller.selectPaymentMethod(method);
          },
        ),
        40.verticalSpace,
        // if (state.selectedMethod?.id == 'credit_card')
        //   EmptyCardsSection(
        //     onAddCard: () {
        //       context.pushRoute(const AddCardRoute());
        //     },
        //   ),
        const Spacer(),
        PaymentBottomSection(
          totalAmount: state.totalAmount,
          selectedMethod: state.selectedMethod?.id,
          onPay: () {
            if (state.selectedMethod != null) {
              controller.processPayment(context);
            }
          },
        ),
      ],
    );
  }
}
