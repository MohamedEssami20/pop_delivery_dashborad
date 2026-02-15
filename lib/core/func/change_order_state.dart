import '../helper/order_state.dart';

String changeOrderState(String orderState) {
  switch (orderState) {
    case "preparing":
      return OrderState.onTheWay.name;
    case "onTheWay":
      return OrderState.delivered.name;
    case "delivered":
      return OrderState.completed.name;
    default:
      return OrderState.cancelled.name;
  }
}