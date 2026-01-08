import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/func/get_dummy_order.dart';
import '../../manager/get_orders_cubit/get_orders_cubit.dart';
import 'orders_list_view.dart';

class OrdersListViewBuilder extends StatefulWidget {
  const OrdersListViewBuilder({super.key});

  @override
  State<OrdersListViewBuilder> createState() => _OrdersListViewBuilderState();
}

class _OrdersListViewBuilderState extends State<OrdersListViewBuilder> {
  @override
  void initState() {
    context.read<GetOrdersCubit>().getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersSuccess) {
          if (state.orders.isEmpty) {
            return const Center(
              child: Text(
                "No orders found",
                style: TextStyle(color: Colors.black),
              ),
            );
          }
          return OrdersListView(orders: state.orders);
        } else if (state is GetOrdersFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.black),
            ),
          );
        } else {
          return Skeletonizer(
            child: OrdersListView(
              orders: List.generate(5, (index) => getDummyOrder()),
            ),
          );
        }
      },
    );
  }
}
