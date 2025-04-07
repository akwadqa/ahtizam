import 'package:ahtizam/src/features/notifications/presentation/widgets/notification_card_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/theme/app_colors.dart';

import '../../../../shared_widgets/custom_appbar.dart';

import 'package:ahtizam/gen/assets.gen.dart';

@RoutePage()
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = [
      (
        driverName: 'السائق سالم',
        message: 'أرسل عرض بـ 75 ر.ق',
        time: 'منذ 1 دقيقة',
      ),
      (
        driverName: 'السائق أحمد',
        message: 'أرسل عرض بـ 54 ر.ق',
        time: 'منذ 2 دقيقة',
      ),
      (
        driverName: 'السائق أيمن',
        message: 'أرسل عرض بـ 60 ر.ق',
        time: 'منذ 2 دقيقة',
      ),
      (
        driverName: 'السائق عامر',
        message: 'أرسل عرض بـ 80 ر.ق',
        time: 'منذ 3 دقيقة',
      ),
      (
        driverName: 'السائق سالم',
        message: 'أرسل عرض بـ 75 ر.ق',
        time: 'منذ 3 دقيقة',
      ),
      (
        driverName: 'السائق أحمد',
        message: 'أرسل عرض بـ 54 ر.ق',
        time: 'منذ 3 دقيقة',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "notifications"),
      ),
      body: ListView.separated(
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
