import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/views/widgets/change_order_state_builder.dart';
import 'orders_list_view_builder.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeOrderStateBuilder(child: OrdersListViewBuilder());
  }
}
