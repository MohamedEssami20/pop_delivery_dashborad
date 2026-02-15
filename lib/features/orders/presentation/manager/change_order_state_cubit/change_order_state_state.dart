part of 'change_order_state_cubit.dart';

sealed class ChangeOrderStateState extends Equatable {
  const ChangeOrderStateState();

  @override
  List<Object> get props => [];
}

final class ChangeOrderStateInitial extends ChangeOrderStateState {}

// create all state of change order state cubit;  

final class ChangeOrderStateLoading extends ChangeOrderStateState {}

final class ChangeOrderStateSuccess extends ChangeOrderStateState {}

final class ChangeOrderStateFailure extends ChangeOrderStateState {
  final String errorMessage;

  const ChangeOrderStateFailure({required this.errorMessage});
}
