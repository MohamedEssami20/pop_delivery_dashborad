import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/features/add_advertsing/presentation/manager/advertising_product_cubit/advertising_product_cubit.dart';

import '../../../../../core/func/build_error_snackbar.dart';
import '../../../../../core/func/build_success_snackbar.dart';

class AddAdvertisingProductButtonBuilder extends StatelessWidget {
  const AddAdvertisingProductButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertisingProductCubit, AdvertisingProductState>(
      builder: (context, state) {
        if (state is AdvertisingProductLoading) {
          return const CircularProgressIndicator(color: Colors.white);
        } else {
          return Text("Add Product", style: TextStyle(color: Colors.white));
        }
      },

      listener: (context, state) {
        if (state is AdvertisingProductSuccess) {
          buildSuccessSnackBar(context, "advertising product added successfully");
        }
        if (state is AdvertisingProductError) {
          buildErrorSnackBar(context, state.errorMessage);
        }
      },
    );
  }
}
