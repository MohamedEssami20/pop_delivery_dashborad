import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/core/utils/get_it_service.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/manager/change_order_state_cubit/change_order_state_cubit.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:popo_delivery_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';

import '../../domain/repos/order_repos.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetOrdersCubit(
            orderRepos: GetItService().getIt.get<OrderRepos>(),
          ),
        ),
        BlocProvider(create: (context) => ChangeOrderStateCubit(
          orderRepos: GetItService().getIt.get<OrderRepos>(),
        )),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Orders", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.green.shade900,
        ),
        body: const OrderViewBody(),
      ),
    );
  }
}
