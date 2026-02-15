import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/repos/order_repos.dart';

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
  }) async {
    emit(ChangeOrderStateLoading());
    final result = await orderRepos.changeOrderState(
      orderState: orderState,
      orderId: orderId,
      userId: userId,
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
