import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/get_it_service.dart';
import '../../domain/repos/advertising_product_repo.dart';
import '../manager/advertising_product_cubit/advertising_product_cubit.dart';
import '../widgets/add_advertising_view_body.dart';

class AddAdvertsingView extends StatelessWidget {
  const AddAdvertsingView({super.key});
  static const String routeName = "adds";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvertisingProductCubit(
        advertisingProductRepo: GetItService().getIt
            .get<AdvertisingProductRepo>(),
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
        body: AddAdvertisingViewBody(),
      ),
    );
  }
}
