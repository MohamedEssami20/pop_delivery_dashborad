String nextOrderState(String state) {
  switch (state) {
    case "preparing":
      return "onTheWay";
    case "onTheWay":
      return "delivered";
    default:
      return "completed";
  }
}
