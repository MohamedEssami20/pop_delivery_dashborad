import 'package:flutter/material.dart';

import 'core/utils/on_generate_route.dart';
import 'main_view.dart';

void main() {
  runApp(const BopoDeliveryFoodDashboard());
}

class BopoDeliveryFoodDashboard extends StatelessWidget {
  const BopoDeliveryFoodDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: MainView.routeName,
    );
  }
}
