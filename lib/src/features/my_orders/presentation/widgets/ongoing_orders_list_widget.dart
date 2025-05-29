// features/my_orders/presentation/widgets/ongoing_orders_list_widget.dart
import 'package:ahtizam/src/features/my_orders/presentation/controller/my_orders_controller.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/my_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OngoingOrdersList extends ConsumerWidget {
  const OngoingOrdersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch all orders from the controller
    final allOrders = ref.watch(myOrdersControllerProvider);


    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: allOrders.length,
      itemBuilder: (_, index) => OrderCardWidget(
        isOngoing: true, // Indicating this is an ongoing order
        order: allOrders[index], // Passing the ongoing order data
      ),
    );
  }
}
