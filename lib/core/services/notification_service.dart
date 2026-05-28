abstract class NotificationService {
  /// Initializes notifications: requests permissions, sets up listeners
  Future<void> init();

  /// Gets the unique FCM device token
  Future<String?> getToken();

  /// Subscribes the device to a messaging topic (e.g. 'orders')
  Future<void> subscribeToTopic(String topic);

  /// Unsubscribes the device from a messaging topic
  Future<void> unsubscribeFromTopic(String topic);
}
