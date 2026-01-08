part of 'get_orders_cubit.dart';

sealed class GetOrdersState extends Equatable {
  const GetOrdersState();

  @override
  List<Object> get props => [];
}

final class GetOrdersInitial extends GetOrdersState {}

// create all state of get orders cubit;
class GetOrdersLoading extends GetOrdersState {}

class GetOrdersSuccess extends GetOrdersState {
  final List<OrderEntity> orders;
  const GetOrdersSuccess({required this.orders});
}

class GetOrdersFailure extends GetOrdersState {
  final String errorMessage;
  const GetOrdersFailure({required this.errorMessage});
}
