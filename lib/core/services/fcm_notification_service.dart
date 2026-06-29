import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import '../repos/admin_repo.dart';
import 'local_notification_service.dart';
import 'notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Background/Terminated message received: ${message.messageId}");
  log("Data: ${message.data}");
  if (message.notification != null) {
    log(
      "Notification: ${message.notification!.title} - ${message.notification!.body}",
    );
  }
}

class FcmNotificationService implements NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final LocalNotificationService _localNotifications = LocalNotificationService();

  @override
  Future<void> init() async {
    // 1. Initialize local notifications
    await _localNotifications.init();

    // 2. Request notification permissions (required for iOS and Android 13+)
    await _requestPermissions();

    // 3. Set foreground presentation options (especially for iOS)
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // 4. Configure background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 5. Listen to foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Foreground message received: ${message.messageId}');
      log('Title: ${message.notification?.title}');
      log('Body: ${message.notification?.body}');
      log('Data: ${message.data}');

      final notification = message.notification;
      if (notification != null) {
        _localNotifications.showNotification(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          payload: message.data.toString(),
        );
      } else if (message.data.isNotEmpty) {
        final String? title = message.data['title'];
        final String? body = message.data['body'];
        if (title != null || body != null) {
          _localNotifications.showNotification(
            id: message.hashCode,
            title: title,
            body: body,
            payload: message.data.toString(),
          );
        }
      }
    });

    // 6. Listen to app open from background state via notification click
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log(
        'Notification clicked! App opened from background: ${message.messageId}',
      );
      log('Data: ${message.data}');
      // Typically you would navigate to a specific screen based on message data here
    });

    // 7. Handle app open from terminated state via notification click
    final initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      log(
        'App opened from terminated state via notification: ${initialMessage.messageId}',
      );
      log('Data: ${initialMessage.data}');
    }

    // 8. Get and log the token for debugging/backend use
    final token = await getToken();
    if (token != null) {
      log("FCM Token initialized: $token");
      await GetIt.instance.get<AdminRepo>().updateFCMToken(token);

      // subscribe after token is confirmed
      await _fcm.subscribeToTopic('dashboard_updates');
      log("Subscribed After Token Confirmation");
    }

    // 9. listen to token update
    _fcm.onTokenRefresh.listen((String newToken) async {
      log("FCM Token updated: $newToken");
      // update token at firestore
      await GetIt.instance.get<AdminRepo>().updateFCMToken(newToken);
    });

    // Automatically subscribe to common topic for deliveries dashboard
    await subscribeToTopic('dashboard_updates');
  }

  Future<void> _requestPermissions() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted notification permissions.');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional notification permissions.');
    } else {
      log('User declined or has not accepted notification permissions.');
    }

    // Request Android local notification permission
    await _localNotifications.requestPermissions();
  }

  @override
  Future<String?> getToken() async {
    try {
      String? token = await _fcm.getToken();
      if (token != null) {
        await GetIt.instance.get<AdminRepo>().updateFCMToken(token);
      }
      return token;
    } catch (e) {
      log("Error fetching FCM token: $e");
      return null;
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _fcm.subscribeToTopic(topic);
      log("Successfully subscribed to topic: $topic");
    } catch (e) {
      log("Failed to subscribe to topic: $topic, error: $e");
    }
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _fcm.unsubscribeFromTopic(topic);
      log("Successfully unsubscribed from topic: $topic");
    } catch (e) {
      log("Failed to unsubscribe from topic: $topic, error: $e");
    }
  }
}
