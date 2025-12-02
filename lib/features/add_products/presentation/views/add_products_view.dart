import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/core/utils/get_it_service.dart';
import 'package:popo_delivery_dashboard/features/add_products/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:popo_delivery_dashboard/features/add_products/presentation/views/widgets/add_product_view_body.dart';

import '../../domain/repos/add_product_repo.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const String routeName = 'addproducts';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        addProductRepo: GetItService().getIt.get<AddProductRepo>(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Add Products",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade900,
        ),
        body: AddProductViewBody(),
      ),
    );
  }
}
