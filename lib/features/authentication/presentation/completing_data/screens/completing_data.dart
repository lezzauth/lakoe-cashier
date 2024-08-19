import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/completing_data/arguments.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form_page.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/form_step_indicator.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/pin_input_page.dart';

class CompletingDataScreen extends StatelessWidget {
  const CompletingDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as CompletingDataRouteArguments?;
    final isWithCustomArgs = ModalRoute.of(context) != null;

    return Scaffold(
      body: BlocProvider(
        create: (context) => CompletingDataPageBloc(page: args?.page),
        child: BlocBuilder<CompletingDataPageBloc, CompletingDataPageState>(
          builder: (context, state) => SafeArea(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Flexible(
                        child: FormStepIndicator(active: true),
                      ),
                      const SizedBox(
                        width: 6.28,
                      ),
                      Flexible(
                        child: FormStepIndicator(
                            active: state.page == CompletingDataPage.pinInput),
                      ),
                    ],
                  ),
                ),
                if (state.page == CompletingDataPage.businessForm)
                  const CompletingDataFormPage(),
                if (state.page == CompletingDataPage.pinInput)
                  PinInputPage(
                    title: args?.title ?? "Buat kode akses (PIN)",
                    description: args?.description ??
                        "Kode akses ini akan digunakan untuk setiap kali akan melakukan transaksi.",
                    onPinValid: args?.onPinValid ??
                        (value) {
                          Navigator.popAndPushNamed(context, "/home");
                        },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
