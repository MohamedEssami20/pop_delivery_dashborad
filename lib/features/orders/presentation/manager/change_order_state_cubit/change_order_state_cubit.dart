import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/features/notifications/domain/entities/notification_entity.dart';
import 'package:popo_delivery_dashboard/features/notifications/domain/repos/notification_repo.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/repos/order_repos.dart';

import '../../../../../core/services/cloud_flare_notification_service.dart'
    show CloudflareNotificationService;
import '../../../../../core/utils/get_it_service.dart';

part 'change_order_state_state.dart';

class ChangeOrderStateCubit extends Cubit<ChangeOrderStateState> {
  ChangeOrderStateCubit({
    required this.orderRepos,
    required this.notificationRepo,
  }) : super(ChangeOrderStateInitial());

  final OrderRepos orderRepos;
  final NotificationRepo notificationRepo;

  // Change order state, push a push notification, and save the notification to
  // Firestore under the user's UID document.
  Future<void> changeOrderState({
    required String orderState,
    required int orderId,
    required String userId,
    required String userFCMToken,
  }) async {
    emit(ChangeOrderStateLoading());

    // 1. Update the order state in Firestore.
    final result = await orderRepos.changeOrderState(
      orderState: orderState,
      orderId: orderId,
      userId: userId,
    );

    result.fold(
      (failure) {
        emit(ChangeOrderStateFailure(errorMessage: failure.errorMessage));
      },
      (_) async {
        // 2. Send a push notification to the user's device.
        final cloudflareService = GetItService().getIt
            .get<CloudflareNotificationService>();
        cloudflareService.sendNotificationToToken(
          token: userFCMToken,
          title: 'Order Updated',
          body: 'Your order #$orderId has been updated to $orderState',
        );

        // 3. Save the notification to Firestore so the user can see it later.
        final notificationId =
            '${userId}_${orderId}_${DateTime.now().millisecondsSinceEpoch}';
        await notificationRepo.saveNotification(
          notification: NotificationEntity(
            id: notificationId,
            title: 'Order Updated',
            body: 'Your order #$orderId has been updated to $orderState',
            userId: userId,
            dateTime: DateTime.now(),
            isRead: false,
            orderId: orderId.toString(),
            orderState: orderState,
          ),
        );

        emit(ChangeOrderStateSuccess());
      },
    );
  }
}
