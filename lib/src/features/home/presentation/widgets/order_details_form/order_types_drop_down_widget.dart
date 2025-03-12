import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// **Dropdown Selector for Request Type**
class OrdersTypeDropDownWidget extends StatelessWidget {
  const OrdersTypeDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ["request_now", "request_offer"];

    return FormField<String>(
      initialValue: "request_now",
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
          onChanged: (value) {
            state.didChange(value);
          },
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.tr(), style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
        );
      },
    );
  }
}
