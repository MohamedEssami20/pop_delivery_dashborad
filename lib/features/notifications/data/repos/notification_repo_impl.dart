import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:popo_delivery_dashboard/core/errors/failure.dart';
import 'package:popo_delivery_dashboard/core/services/data_base_service.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';
import 'package:popo_delivery_dashboard/features/notifications/data/models/notification_model.dart';
import 'package:popo_delivery_dashboard/features/notifications/domain/entities/notification_entity.dart';
import 'package:popo_delivery_dashboard/features/notifications/domain/repos/notification_repo.dart';

/// Firestore document layout
/// ─────────────────────────
/// notifications/                       ← top-level collection
///   {uid}/                             ← document ID = user UID
///     userNotifications/               ← sub-collection
///       {notificationId}/              ← individual notification document
class NotificationRepoImpl implements NotificationRepo {
  final DataBaseService dataBaseService;

  NotificationRepoImpl({required this.dataBaseService});

  // ── Save notification ─────────────────────────────────────────────────────

  @override
  Future<Either<Failure, void>> saveNotification({
    required NotificationEntity notification,
  }) async {
    try {
      await dataBaseService.addSubCollectionData(
        mainPath: BackendEndpoints.notifications,
        mainDocumentId: notification.userId,
        subPath: BackendEndpoints.userNotifications,
        subDocumentId: notification.id,
        data: NotificationModel.fromEntity(notification).toMap(),
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      log('Error saving notification: ${e.message}');
      return Left(ServerFailure(errorMessage: e.message ?? 'Firebase error'));
    } catch (e) {
      log('Unexpected error saving notification: $e');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ── Get notifications as real-time stream ─────────────────────────────────

  @override
  Stream<Either<Failure, List<NotificationEntity>>> getNotifications({
    required String uid,
  }) async* {
    try {
      final stream = dataBaseService.getSubCollectionStream(
        mainPath: BackendEndpoints.notifications,
        mainDocumentId: uid,
        subPath: BackendEndpoints.userNotifications,
        query: {'orderBy': 'dateTime', 'descending': true},
      );

      await for (final docs in stream) {
        final notifications = docs
            .map((map) => NotificationModel.fromMap(map).toEntity())
            .toList();
        yield Right(notifications);
      }
    } on FirebaseException catch (e) {
      log('Error fetching notifications: ${e.message}');
      yield Left(ServerFailure(errorMessage: e.message ?? 'Firebase error'));
    } catch (e) {
      log('Unexpected error fetching notifications: $e');
      yield Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ── Mark notification as read ─────────────────────────────────────────────

  @override
  Future<Either<Failure, void>> markNotificationAsRead({
    required String uid,
    required String notificationId,
  }) async {
    try {
      await dataBaseService.updateData(
        mainPath: BackendEndpoints.notifications,
        mainDocumentId: uid,
        subPath: BackendEndpoints.userNotifications,
        subDocumentId: notificationId,
        data: {'isRead': true},
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      log('Error marking notification as read: ${e.message}');
      return Left(ServerFailure(errorMessage: e.message ?? 'Firebase error'));
    } catch (e) {
      log('Unexpected error marking notification as read: $e');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ── Delete notification ───────────────────────────────────────────────────

  @override
  Future<Either<Failure, void>> deleteNotification({
    required String uid,
    required String notificationId,
  }) async {
    try {
      await dataBaseService.deleteSubCollectionData(
        mainPath: BackendEndpoints.notifications,
        mainDocumentId: uid,
        subPath: BackendEndpoints.userNotifications,
        subDocumentId: notificationId,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      log('Error deleting notification: ${e.message}');
      return Left(ServerFailure(errorMessage: e.message ?? 'Firebase error'));
    } catch (e) {
      log('Unexpected error deleting notification: $e');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
