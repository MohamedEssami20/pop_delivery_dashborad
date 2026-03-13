String nextOrderState(String state) {
  switch (state) {
    case "preparing":
      return "onTheWay";
    case "onTheWay":
      return "delivered";
    case "cancelled":
      return "cancelled";
    default:
      return "completed";
  }
}
