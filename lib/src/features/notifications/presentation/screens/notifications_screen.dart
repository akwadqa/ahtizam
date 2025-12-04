import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/notifications/domain/model/orders_offer_notifications_model.dart';
import 'package:ahtizam/src/features/notifications/presentation/controller/orders_offers_notifications_controller.dart';
import 'package:ahtizam/src/features/notifications/presentation/widgets/notification_card_widget.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/app_pagination_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../extenssions/numbers_extension.dart';
import '../../../../shared_widgets/custom_appbar.dart';

@RoutePage()
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersNotificationsAsync = ref.watch(
      ordersOffersNotificationsControllerProvider,
    );
    final controller = ref.read(
      ordersOffersNotificationsControllerProvider.notifier,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('notifications')),
      ),
      body: ordersNotificationsAsync.when(
        data: (notifications) {
          if (notifications.isEmpty) {
            return  Center(child: Text('no_notifications'.tr()));
          }

          final grouped = <String, List<_NotificationWrapper>>{};

          for (final item in notifications) {
            final createdAt = item.creationDate;
            final dateKey = DateFormat('dd-MM-yyyy').format(createdAt);
            final formattedTime = item.creationTime.formatTimeLocalized(
              context,
            );

            grouped
                .putIfAbsent(dateKey, () => [])
                .add(
                  _NotificationWrapper(
                    notification: item,
                    formattedTime: formattedTime,
                  ),
                );
          }

          final groupedEntries = grouped.entries.toList()
            ..sort((a, b) => b.key.compareTo(a.key));

          return AppPaginationWidget(
            onLoading: (page) async => await controller.loadNextPage(),
            onRefresh: () async => await controller.refreshOrders(),
            enablePullDown: true,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: groupedEntries.fold(
                0,
                (count, e) => count! + e.value.length + 1,
              ),
              itemBuilder: (context, index) {
                int runningIndex = 0;

                for (final entry in groupedEntries) {
                  if (index == runningIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          '------------------------- ${entry.key} -------------------------',
                          style: const TextStyle(color: Colors.grey),
                        ).onlyPadding(top: 8),
                      ),
                    );
                  }

                  runningIndex++;

                  for (final item in entry.value) {
                    if (index == runningIndex) {
                      final data = item.notification;
                      return NotificationCardWidget(
                        name: data.passengerDetails.fullName,
                        message: tr(
                          'offer_message',
                          namedArgs: {
                            'amount': data
                                .orderOfferNotificationDetails
                                .finalFee
                                .toString(),
                          },
                        ),
                        time: item.formattedTime,
                        imageUrl: data.passengerDetails.profileImage,
                      );
                    }
                    runningIndex++;
                  }
                }

                return const SizedBox.shrink();
              },
            ),
          );
        },
        error: (error, stackTrace) => const AppErrorWidget(),
        loading: () => const Center(child: FadeCircleLoadingIndicator()),
      ),
    );
  }
}

class _NotificationWrapper {
  final OrdersOfferNotificationsModel notification;
  final String formattedTime;

  _NotificationWrapper({
    required this.notification,
    required this.formattedTime,
  });
}
