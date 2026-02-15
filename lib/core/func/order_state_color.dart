import 'package:flutter/material.dart';

Color orderStateColor(String state) {
  switch (state) {
    case 'preparing':
      return Colors.blue;
    case 'onTheWay':
      return Colors.yellow;
    case 'delivered':
      return Colors.green;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Color orderStateTextColor(String state) {
  switch (state) {
    case 'preparing':
      return Colors.black;
    case 'onTheWay':
      return Colors.black;
    case 'delivered':
      return Colors.black;
    case 'cancelled':
      return Colors.white;
    default:
      return Colors.grey;
  }
}
