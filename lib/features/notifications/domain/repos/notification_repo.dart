import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/errors/failure.dart';
import 'package:popo_delivery_dashboard/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationRepo {
  /// Save a notification under the user's document in Firestore.
  /// Document path: notifications/{uid}/userNotifications/{notificationId}
  Future<Either<Failure, void>> saveNotification({
    required NotificationEntity notification,
  });

  /// Fetch all notifications for a specific user as a real-time stream.
  Stream<Either<Failure, List<NotificationEntity>>> getNotifications({
    required String uid,
  });

  /// Mark a single notification as read.
  Future<Either<Failure, void>> markNotificationAsRead({
    required String uid,
    required String notificationId,
  });

  /// Delete a single notification.
  Future<Either<Failure, void>> deleteNotification({
    required String uid,
    required String notificationId,
  });
}
