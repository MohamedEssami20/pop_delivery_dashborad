import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/features/add_products/presentation/views/widgets/add_product_view_body.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const String routeName = 'addproducts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
