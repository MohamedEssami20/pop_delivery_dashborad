import 'package:flutter/material.dart';

import '../widgets/add_advertising_view_body.dart';

class AddAdvertsingView extends StatelessWidget {
  const AddAdvertsingView({super.key});
  static const String routeName = "adds";
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
        body: AddAdvertisingViewBody(),
      );
  }
}
