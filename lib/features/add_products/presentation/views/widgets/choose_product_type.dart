import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';

class ChosseProductType extends StatelessWidget {
  const ChosseProductType({super.key, this.onchanged, this.value});
  final Function(String?)? onchanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffe6e9e9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: value ?? BackendEndpoints.offers,
          hint: const Text("Product Type"),
          items: const [
            DropdownMenuItem(
              value: BackendEndpoints.offers,
              child: Text(BackendEndpoints.offers),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.pizza,
              child: Text(BackendEndpoints.pizza),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.softDrinks,
              child: Text(BackendEndpoints.softDrinks),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.burger,
              child: Text(BackendEndpoints.burger),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.dounut,
              child: Text(BackendEndpoints.dounut),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.iceCream,
              child: Text(BackendEndpoints.iceCream),
            ),
          ],
          onChanged: onchanged,
        ),
      ),
    );
  }
}
