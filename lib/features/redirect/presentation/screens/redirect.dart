import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:token_provider/token_provider.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  final TokenProvider _tokenProvider = TokenProvider();

  Future<void> onAppRedirect() async {
    if (!context.mounted) return;

    try {
      final appToken = await _tokenProvider.getAppToken();

      if (appToken == null) {
        Navigator.of(context).popAndPushNamed("/on-boarding");
        return;
      }

      context
          .read<AuthCubit>()
          .ready(appToken, "d0ea6025-bfa9-4d91-8ae8-80320b3413b8");
      Navigator.of(context).popAndPushNamed("/cashier");
    } catch (e) {
      Navigator.of(context).popAndPushNamed("/on-boarding");
    }
  }

  @override
  void initState() {
    super.initState();
    onAppRedirect();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {},
      child: BlocListener<CashierCubit, CashierState>(
        listener: (context, state) {},
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
