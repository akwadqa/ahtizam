import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/payment/domain/models/payment_method.dart';
import 'package:flutter/material.dart';
import 'payment_method_item.dart';

class PaymentMethodsList extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  final PaymentMethod? selectedMethod;
  final Function(PaymentMethod) onMethodSelected;

  const PaymentMethodsList({
    super.key,
    required this.paymentMethods,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shrinkWrap: true,
        itemCount: paymentMethods.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 16.horizontalSpace,
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return PaymentMethodItem(
            icon: method.icon,
            title: method.title,
            isSelected: selectedMethod?.id == method.id,
            onTap: () => onMethodSelected(method),
          );
        },
      ),
    );
  }
}
