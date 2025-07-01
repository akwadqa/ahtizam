// features/my_orders/presentation/widgets/past_orders_list_widget.dart

import 'package:ahtizam/src/features/my_orders/presentation/controller/my_orders_controller.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/my_order_card.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/shared_widgets/app_pagination_widget.dart';

class PastOrdersList extends ConsumerWidget {
  const PastOrdersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOrders = ref.watch(myOrdersControllerProvider);

    return asyncOrders.when(
      data: (orders) {
        if (orders.isEmpty) {
          return  Center(child: Text('no_orders_found'.tr()));
        }

        final pastOrders = orders.where((order) => order.status != 'Accepted').toList();

        if (pastOrders.isEmpty) {
          return  Center(child: Text('no_orders_found'.tr()));
        }

        return AppPaginationWidget(
          enablePullDown: true,
          onRefresh: () async {
            await ref.read(myOrdersControllerProvider.notifier).refreshOrders();
            return true;
          },
          onLoading: (page) async {
            return await ref.read(myOrdersControllerProvider.notifier).loadNextPage();
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: pastOrders.length,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                context.pushRoute(
                  MyOrderDetailsRoute(
                    quickOrderId: pastOrders[index].quickOrderId,
                  ),
                );
              },
              child: OrderCardWidget(
                isOngoing: false,
                order: pastOrders[index],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => const AppErrorWidget(),
      loading: () => const FadeCircleLoadingIndicator(),
    );
  }
}
