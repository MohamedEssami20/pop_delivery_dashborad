import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/repos/order_repos.dart';

import '../../../domain/entities/order_entity.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit({required this.orderRepos}) : super(GetOrdersInitial());
  final OrderRepos orderRepos;

  StreamSubscription? _streamSubscription;

  // create method that get all orders
  Future<void> getOrders() async {
    _streamSubscription?.cancel();
    emit(GetOrdersLoading());
    _streamSubscription = orderRepos.getOrders().listen((orders) {
      orders.fold((failure) {
        emit(GetOrdersFailure(errorMessage: failure.errorMessage));
      }, (orders) {
        emit(GetOrdersSuccess(orders: orders));
      });
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
