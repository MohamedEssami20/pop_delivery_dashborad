import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/main_view.dart';
import '../../features/add_products/presentation/views/add_products_view.dart';
import '../../features/orders/presentation/views/orders_view.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductsView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (_) => const OrdersView());
    default:
      return null;
  }
}
