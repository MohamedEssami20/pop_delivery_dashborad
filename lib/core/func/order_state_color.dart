import 'package:flutter/material.dart';

Color orderStateColor(String state) {
  switch (state) {
    case 'OrderState.preparing':
      return Colors.blue;
    case 'OrderState.onTheWay':
      return Colors.yellow;
    case 'OrderState.delivered':
      return Colors.green;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Color orderStateTextColor(String state) {
  switch (state) {
    case 'OrderState.preparing':
      return Colors.black;
    case 'OrderState.onTheWay':
      return Colors.black;
    case 'OrderState.delivered':
      return Colors.black;
    case 'cancelled':
      return Colors.white;
    default:
      return Colors.grey;
  }
}
