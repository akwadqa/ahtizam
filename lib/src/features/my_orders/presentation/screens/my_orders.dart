import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/my_orders/presentation/controller/my_orders_controller.dart';
import 'package:ahtizam/src/features/my_orders/presentation/controller/my_orders_tab_controller.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/ongoing_orders_list_widget.dart';
import 'package:ahtizam/src/features/my_orders/presentation/widgets/past_orders_list_widget.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../routing/app_router.gr.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../shared_widgets/dotted_path_with_circles.dart';

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
      body: TabBarView(
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

/// --- ONGOING LIST ---
class _OngoingOrdersList extends StatelessWidget {
  const _OngoingOrdersList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 2,
      itemBuilder: (_, index) => const _OrderCard(isOngoing: true),
    );
  }
}

/// --- PAST LIST ---
class _PastOrdersList extends StatelessWidget {
  const _PastOrdersList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 2,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
                context.pushRoute(MyOrderDetailsRoute());
              },
        child: const _OrderCard(isOngoing: false)),
    );
  }
}

/// --- ORDER CARD ---
class _OrderCard extends StatelessWidget {
  final bool isOngoing;
  const _OrderCard({required this.isOngoing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.grayBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleImageWidget(
                  imageUrl: "https://i.pravatar.cc/150?img=3",
                  circleWidth: 4,
                  height: 120,
                  width: 120,
                ),
                8.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "سالم",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          "4.5",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 14, color: AppColors.nevy),
                        ),
                      ],
                    ),
                    3.verticalSpace,
                    Text(context.tr("otp_number", args: ["2000"])),
                    8.verticalSpace,
                    if (isOngoing)
                      Text(
                        context.tr("payment_method"),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.dark),
                      ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Assets.icons.truck.svg(),
                    6.verticalSpace,
                    Text(
                      "KE232",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    12.verticalSpace,
                    if (isOngoing)
                      Text(
                        context.tr("apple_pay"),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w800, fontSize: 12),
                      ),
                  ],
                ),
              ],
            ),
            if (isOngoing)
              Divider(
                height: 1,
                color: AppColors.lightGray,
              ).symmetricPadding(vertical: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                    width: 20, height: 120, child: DottedPathWithCircles()),
                14.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "شارع ألف",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "شارع باء",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.tr("order_number", args: ["1252"]),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    20.verticalSpace,
                    Text(
                      context.tr("order_date", args: ["20 أكتوبر 23"]),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    20.verticalSpace,
                    Text(
                      context.tr("order_time", args: ["10:00 صباحا"]),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            if (isOngoing) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: CustomButtonWidget(
                      onTap: () {},
                      backgroundColor: AppColors.black,
                      isFiled: true,
                      height: 55,
                      radius: 12,
                      width: MediaQuery.sizeOf(context).width,
                      text: "",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.phoneIc.svg(),
                          10.horizontalSpace,
                          Text(
                            context.tr("call_by", args: ["user"]),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 15,
                                  color: (Colors.white),
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: CustomButtonWidget(
                      text: context.tr("message"),
                      onTap: () {},
                      color: AppColors.black,
                      borderColor: AppColors.grayBorder,
                      isFiled: false,
                      height: 55,
                      radius: 12,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
