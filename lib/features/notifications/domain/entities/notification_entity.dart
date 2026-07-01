class NotificationEntity {
  final String id;
  final String title;
  final String body;
  final String userId;
  final DateTime dateTime;
  final bool isRead;
  final String? orderId;
  final String? orderState;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.dateTime,
    required this.isRead,
    this.orderId,
    this.orderState,
  });
}
