import 'package:ahtizam/src/features/notifications/presentation/widgets/notification_card_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../shared_widgets/custom_appbar.dart';

@RoutePage()
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = [
      (
        driverName: context.tr('driver_name', args: ['سالم']),
        message: context.tr('sent_offer', args: ['75']),
        time: context.tr('time_ago', args: ['1']),
      ),
      (
        driverName: context.tr('driver_name', args: ['أحمد']),
        message: context.tr('sent_offer', args: ['54']),
        time: context.tr('time_ago', args: ['2']),
      ),
      (
        driverName: context.tr('driver_name', args: ['أيمن']),
        message: context.tr('sent_offer', args: ['60']),
        time: context.tr('time_ago', args: ['2']),
      ),
      (
        driverName: context.tr('driver_name', args: ['عامر']),
        message: context.tr('sent_offer', args: ['80']),
        time: context.tr('time_ago', args: ['3']),
      ),
      (
        driverName: context.tr('driver_name', args: ['سالم']),
        message: context.tr('sent_offer', args: ['75']),
        time: context.tr('time_ago', args: ['3']),
      ),
      (
        driverName: context.tr('driver_name', args: ['أحمد']),
        message: context.tr('sent_offer', args: ['54']),
        time: context.tr('time_ago', args: ['3']),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('notifications')),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                context.tr('no_notifications'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: AppColors.lightGray,
              ),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationCardWidget(
                  driverName: notification.driverName,
                  message: notification.message,
                  time: notification.time,
                  imageUrl:
                      "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
                );
              },
            ),
    );
  }
}
