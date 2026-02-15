import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/core/helper/custom_progress_hud.dart';

import '../../../../../core/func/build_error_snackbar.dart';
import '../../../../../core/func/build_success_snackbar.dart';
import '../../manager/change_order_state_cubit/change_order_state_cubit.dart';

class ChangeOrderStateBuilder extends StatelessWidget {
  const ChangeOrderStateBuilder({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeOrderStateCubit, ChangeOrderStateState>(
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is ChangeOrderStateLoading,
          child: child,
        );
      },

      listener: (context, state) {
        if (state is ChangeOrderStateFailure) {
          buildErrorSnackBar(context, state.errorMessage);
        }
        if (state is ChangeOrderStateSuccess) {
          buildSuccessSnackBar(context, "Order state changed successfully");
        }
      },
    );
  }
}
