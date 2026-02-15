import 'package:flutter/material.dart';

Color nextOrderStateColor(String state) {
  switch (state) {
    case "preparing":
      return Colors.orange; // الحالة القادمة onTheWay
    case "onTheWay":
      return Colors.green; // الحالة القادمة delivered
    default:
      return Colors.grey;
  }
}