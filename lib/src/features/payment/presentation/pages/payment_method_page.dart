import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/utils/helper_methods.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;

        if (paymentState.value!.isPaid) {
          // If payment is done, show a confirmation dialog before allowing pop
          final shouldPop = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return showYesNowChoicesDialog(context,
                    title: "alert_paided_title".tr(context: context),
                    dsc:
                        "alert_paided_description".tr(context: context),
                    noButton: () => Navigator.of(context).pop(false),
                    yesButton: () async {
                      Navigator.of(context).pop(true);
                    });
              });

          if (shouldPop == true) {
            // If user chooses Yes, pop the page
            Navigator.pop(context);
          }
        } else {
          // If payment is not done, allow pop
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: CustomAppbar(title: "payment_information"),
        ),
        body: paymentState.when(
          data: (state) {
            if (state.isPaid && paymentState.hasError) {
              Future.microtask(() {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(paymentState.error.toString()),
                    content: Text("payment_done_but_no_driver".tr()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
                          paymentController
                              .retryWithoutPayment(context); // 👈 see next step
                        },
                        child: Text("try_again".tr()),
                      ),
                    ],
                  ),
                );
              });
            }
            return _buildPaymentContent(context, ref, state, paymentController);
          },
          loading: () => const Center(child: FadeCircleLoadingIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }

  Widget _buildPaymentContent(BuildContext context, WidgetRef ref,
      PaymentState state, PaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentMethodsList(
          paymentMethods: state.paymentMethods,
          selectedMethod: state.selectedMethod,
          onMethodSelected: controller.selectPaymentMethod,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: _buildInfoBox(state.selectedMethod),
        ),

        // Summary section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("order_summary".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                16.verticalSpace,
                _buildSummaryRow("base_fee".tr(),
                    "${state.baseAmount.toStringAsFixed(2)} ${'currency'.tr()}"),
                const DottedDivider(
                  height: 1,
                  color: Colors.grey,
                  dashWidth: 4,
                  dashSpacing: 4,
                ),
                _buildSummaryRow("tax_fee".tr(),
                    "${state.taxFee.toStringAsFixed(2)} ${'currency'.tr()}"),
                if (state.discountAmount != null && state.discountAmount! > 0)
                  ...[]
              ],
            ),
          ),
        ),

        const Spacer(),

        PaymentBottomSection(
          totalAmount: state.totalAmount,
          selectedMethod: state.selectedMethod?.id,
          onPay: () {
            if (state.selectedMethod != null) {
              if (state.isPaid) {
                debugPrint("you `ll ready paied");
                controller.retryWithoutPayment(context);
              } else {
                controller.processPayment(context);
              }
            }
          },
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              )),
          Text(value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
                color: color ?? Colors.black87,
              )),
        ],
      ),
    );
  }

  Widget _buildInfoBox(PaymentMethod? selectedMethod) {
    if (selectedMethod == null) {
      return Container(
        decoration: _infoDecoration(),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.grey),
            10.horizontalSpace,
            Expanded(
              child: Text(
                "select_payment_instruction".tr(),
                style: const TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      );
    }

    final description = _getMethodDescription(selectedMethod.id);

    return Container(
      decoration: _infoDecoration(),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: Colors.green),
          10.horizontalSpace,
          Expanded(
            child: Text(
              description,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _infoDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8),
    );
  }

  String _getMethodDescription(String id) {
    switch (id) {
      case 'apple_pay':
        return "apple_pay_info".tr();
      case 'credit_card':
        return "credit_card_info".tr();
      case 'wallet':
        return "wallet_info".tr();
      case 'google_pay':
        return "google_pay_info".tr();
      default:
        return '';
    }
  }
}
