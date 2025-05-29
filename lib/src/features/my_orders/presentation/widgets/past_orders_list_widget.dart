// features/my_orders/presentation/widgets/past_orders_list_widget.dart

import 'package:ahtizam/src/features/my_orders/presentation/controller/my_orders_controller.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/my_order_card.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

class PastOrdersList extends ConsumerWidget {

  const PastOrdersList({super.key,r});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedFilter = ref.watch(myOrdersFilterControllerProvider);
    final allOrders = ref.watch(myOrdersControllerProvider);


    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: allOrders.length,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                context.pushRoute(MyOrderDetailsRoute());
              },
              child: OrderCardWidget(
                isOngoing: false,
                order: allOrders[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
