String getNextOrderState(String state) {
  if (state == "preparing") {
    return "onTheWay";
  } else if (state == "onTheWay") {
    return "Delivering";
  } else if (state == "cancelled") {
    return "cancelled";
  } else {
    return "Completed";
  }
}
