import 'dart:convert';
import 'package:ahtizam/src/core/enums/notification_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../enums/notification_type.dart';
import '../models/notification_model.dart';

part 'notification_service.g.dart';

@riverpod
NotificationService notificationService(NotificationServiceRef ref) =>
    NotificationService();

class NotificationService {
  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();

  // Initialize notification channels and request permissions
  Future<void> initialize() async {
    // Request permission for iOS
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get FCM token
    final token = await _messaging.getToken();
    print('FCM Token: $token'); // Store this token for the user

    // Initialize local notifications
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _localNotifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    // Create notification channel for Android
    await _createNotificationChannel();

    // Handle notifications when app is in background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle notifications when app is in foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  // Create notification channel for Android
  Future<void> _createNotificationChannel() async {
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Handle background messages
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling background message: ${message.messageId}');

    if (message.notification != null) {
      final type = _getNotificationType(message.data['type'] ?? 'general');

      // Create notification model
      final notification = NotificationModel(
        id: message.messageId ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification!.title!,
        body: message.notification!.body!,
        type: type.toString(),
        data: message.data,
        createdAt: DateTime.now(),
      );

      // Store notification in Firestore
      await FirebaseFirestore.instance
          .collection('notifications')
          .doc(notification.id)
          .set(notification.toJson());
    }
  }

  // Handle foreground messages
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('Handling foreground message: ${message.messageId}');

    if (message.notification != null) {
      final type = _getNotificationType(message.data['type'] ?? 'general');

      // Create notification model
      final notification = NotificationModel(
        id: message.messageId ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification!.title!,
        body: message.notification!.body!,
        type: type.toString(),
        data: message.data,
        createdAt: DateTime.now(),
      );

      // Store notification in Firestore
      await FirebaseFirestore.instance
          .collection('notifications')
          .doc(notification.id)
          .set(notification.toJson());

      // Show local notification
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            // icon: android?.smallIcon,
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: json.encode(notification.data),
      );
    }
  }

  // Handle notification tap
  Future<void> _handleNotificationTap(RemoteMessage message) async {
    // Add your notification tap handling logic here
    print('Notification tapped: ${message.messageId}');
    // Handle notification tap based on type
    final type = _getNotificationType(message.data['type'] ?? 'general');
    switch (type) {
      case NotificationType.order:
        // Handle order notification tap
        break;
      case NotificationType.driver:
        // Handle driver notification tap
        break;
      case NotificationType.general:
        // Handle general notification tap
        break;
    }
  }

  // Helper function to determine notification type
  static NotificationType _getNotificationType(String type) {
    switch (type) {
      case 'order':
        return NotificationType.order;
      case 'driver':
        return NotificationType.driver;
      default:
        return NotificationType.general;
    }
  }

  // Get FCM token
  Future<String?> getFCMToken() async {
    return await _messaging.getToken();
  }

  // Delete FCM token
  Future<void> deleteFCMToken() async {
    await _messaging.deleteToken();
  }
}
