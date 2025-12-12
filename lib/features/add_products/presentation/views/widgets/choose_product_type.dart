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
          hint: const Text("Food Type"),
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
            DropdownMenuItem(
              value: BackendEndpoints.indianFood,
              child: Text(BackendEndpoints.indianFood),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.desserts,
              child: Text(BackendEndpoints.desserts),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.fastFood,
              child: Text(BackendEndpoints.fastFood),
            ),
            DropdownMenuItem(
              value: BackendEndpoints.seaFood,
              child: Text(BackendEndpoints.seaFood),
            ),
          ],
          onChanged: onchanged,
        ),
      ),
    );
  }
}
