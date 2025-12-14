import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/core/utils/custom_button.dart';
import 'features/add_products/presentation/views/add_products_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = "/MainView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main View", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 18,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              text: "Add Products",
              onPressed: () {
                Navigator.pushNamed(context, AddProductsView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

