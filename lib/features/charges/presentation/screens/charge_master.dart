import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/presentation/widgets/form/charge_form.dart';

class ChargeMasterScreen extends StatelessWidget {
  const ChargeMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const ChargeMaster(),
        _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
      },
    );
  }
}

class ChargeMaster extends StatefulWidget {
  const ChargeMaster({super.key});

  @override
  State<ChargeMaster> createState() => _ChargeMasterState();
}

class _ChargeMasterState extends State<ChargeMaster> {
  @override
  void initState() {
    super.initState();

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<ChargeMasterCubit>().findAll(ownerId: authState.profile.id);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: "Biaya Lainnya",
      ),
      body: ChargeForm(),
    );
  }
}
