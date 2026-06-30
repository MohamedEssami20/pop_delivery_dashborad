import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/repos/order_repos.dart';

import '../../../../../core/services/cloud_flare_notification_service.dart'
    show CloudflareNotificationService;
import '../../../../../core/utils/get_it_service.dart';

part 'change_order_state_state.dart';

class ChangeOrderStateCubit extends Cubit<ChangeOrderStateState> {
  ChangeOrderStateCubit({required this.orderRepos})
    : super(ChangeOrderStateInitial());

  final OrderRepos orderRepos;

  //create method that change order state
  Future<void> changeOrderState({
    required String orderState,
    required int orderId,
    required String userId,
    required String userFCMToken,
  }) async {
    emit(ChangeOrderStateLoading());
    final result = await orderRepos.changeOrderState(
      orderState: orderState,
      orderId: orderId,
      userId: userId,
    );
    // send notification to user when order state is changed;
    final cloudflareService = GetItService().getIt
        .get<CloudflareNotificationService>();
    cloudflareService.sendNotificationToToken(
      token: userFCMToken,
      title: "Order Updated",
      body: "Your order has been updated to $orderState",
    );
    result.fold(
      (failure) {
        emit(ChangeOrderStateFailure(errorMessage: failure.errorMessage));
      },
      (r) {
        emit(ChangeOrderStateSuccess());
      },
    );
  }
}
