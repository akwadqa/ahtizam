import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/toggle_layers_controllers/show_order_form_controller.dart';

/// **Dropdown Selector for Request Type**
class OrdersTypeDropDownWidget extends ConsumerWidget {
  // final String initialValue;
  const OrdersTypeDropDownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ["request_now", "request_offer"];
        final orderFormController = ref.read(showOrderFormControllerProvider.notifier);

    final scanned = ref.watch(scanDriverQrControllerProvider).value?.scanned??false ;

    return FormField<String>(
      initialValue: orderFormController.initiallValue,

          
      builder: (FormFieldState<String> state) {
        
        return DropdownButtonFormField<String>(
        
          value: state.value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
            onChanged: scanned
              ? null 
              : (value) {
                  orderFormController.intialValueToOrder(value!);
                  state.didChange(value);
                },
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.tr(), style: const TextStyle(fontSize: 14)),
            );
          }).toList(),
        );
      },
    );
  }
}
