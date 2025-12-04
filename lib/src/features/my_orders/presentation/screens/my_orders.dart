import 'package:ahtizam/src/features/my_orders/presentation/controller/my_orders_tab_controller.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/ongoing_orders_list_widget.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/past_orders_list_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: ref.read(ordersTabControllerProvider),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 125),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            context.tr("my_orders"),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black800),
          ),
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 55),
              child: _buildTabBar()),
        ),
      ),
      body: 
      TabBarView(
        controller: _tabController,
        children: const [
          OngoingOrdersList(),
          PastOrdersList(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        PreferredSize(
            preferredSize: Size(double.infinity, 1),
            child: Divider(
              height: 1,
              color: AppColors.lightGray,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grayBorder),
            ),
            child: TabBar(
              controller: _tabController,
              onTap: (index) => ref
                  .read(ordersTabControllerProvider.notifier)
                  .switchTab(index),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12, color: AppColors.black800),
              tabs: [
                Tab(text: context.tr('ongoing')),
                Tab(text: context.tr('past_orders')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


