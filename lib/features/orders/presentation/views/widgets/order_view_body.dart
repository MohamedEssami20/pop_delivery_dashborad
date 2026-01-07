import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/core/func/get_dummy_order.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/views/widgets/orders_list_view.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersListView(
      orders: [
        getDummyOrder(),
        getDummyOrder(),
        getDummyOrder(),
        getDummyOrder(),
      ],
    );
  }
}
