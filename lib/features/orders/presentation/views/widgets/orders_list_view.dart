import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/entities/order_entity.dart';

import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return OrderCard(order: orders[index]);
            },
            itemCount: orders.length,
          ),
        ),
      ],
    );
  }
}
