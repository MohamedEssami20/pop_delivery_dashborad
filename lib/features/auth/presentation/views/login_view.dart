import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:popo_delivery_dashboard/features/auth/domain/repos/auth_repo.dart';
import 'package:popo_delivery_dashboard/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "/LoginView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        authRepo: GetIt.instance.get<AuthRepo>(),
      ),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
