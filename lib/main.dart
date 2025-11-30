import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/firebase_options.dart';

import 'core/services/supabase_storage_service.dart';
import 'core/utils/on_generate_route.dart';
import 'main_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.initSupabaseService();
  await SupabaseStorageService.createBucket("poboimages");
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
