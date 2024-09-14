import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_cubit.dart';
import 'package:point_of_sales_cashier/features/taxes/presentation/widgets/form/tax_form.dart';

class TaxMasterScreen extends StatelessWidget {
  const TaxMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaxMasterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const TaxMaster(),
          _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
        },
      ),
    );
  }
}

class TaxMaster extends StatefulWidget {
  const TaxMaster({super.key});

  @override
  State<TaxMaster> createState() => _TaxMasterState();
}

class _TaxMasterState extends State<TaxMaster> {
  @override
  void initState() {
    super.initState();

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<TaxMasterCubit>().findAll(ownerId: authState.profile.id);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: "Pajak",
      ),
      body: TaxForm(),
    );
  }
}
