import 'package:popo_delivery_dashboard/features/notifications/domain/entities/notification_entity.dart';

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final String userId;
  final DateTime dateTime;
  final bool isRead;
  final String? orderId;
  final String? orderState;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.dateTime,
    required this.isRead,
    this.orderId,
    this.orderState,
  });

  // ── Serialisation ──────────────────────────────────────────────────────────

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'isRead': isRead,
      'orderId': orderId,
      'orderState': orderState,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      body: map['body'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      dateTime: DateTime.parse(
        map['dateTime'] as String? ?? DateTime.now().toIso8601String(),
      ),
      isRead: map['isRead'] as bool? ?? false,
      orderId: map['orderId'] as String?,
      orderState: map['orderState'] as String?,
    );
  }

  // ── Entity conversion ──────────────────────────────────────────────────────

  NotificationEntity toEntity() => NotificationEntity(
    id: id,
    title: title,
    body: body,
    userId: userId,
    dateTime: dateTime,
    isRead: isRead,
    orderId: orderId,
    orderState: orderState,
  );

  factory NotificationModel.fromEntity(NotificationEntity entity) =>
      NotificationModel(
        id: entity.id,
        title: entity.title,
        body: entity.body,
        userId: entity.userId,
        dateTime: entity.dateTime,
        isRead: entity.isRead,
        orderId: entity.orderId,
        orderState: entity.orderState,
      );
}
