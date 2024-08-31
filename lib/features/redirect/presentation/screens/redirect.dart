import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (!mounted) return;

        if (state is AuthNotReady) {
          Navigator.popAndPushNamed(context, "/on-boarding");
        } else if (state is AuthReady) {
          Navigator.popAndPushNamed(context, "/cashier");
        }
      },
      child: BlocListener<CashierCubit, CashierState>(
        listener: (context, state) {},
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
