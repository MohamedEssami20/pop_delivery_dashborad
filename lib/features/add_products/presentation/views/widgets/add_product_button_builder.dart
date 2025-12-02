import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/func/build_error_snackbar.dart';
import '../../../../../core/func/build_success_snackbar.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';

class AddProductButtonBuilder extends StatelessWidget {
  const AddProductButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        if (state is AddProductLoading) {
          return const CircularProgressIndicator(color: Colors.white);
        } else {
          return Text("Add Product", style: TextStyle(color: Colors.white));
        }
      },

      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildSuccessSnackBar(context, "Product added successfully");
        }
        if (state is AddProductError) {
          buildErrorSnackBar(context, state.errorMessage);
        }
      },
    );
  }
}
