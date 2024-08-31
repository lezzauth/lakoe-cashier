import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/completing_data/arguments.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form_page.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/form_step_indicator.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/pin_input_page.dart';

class CompletingDataScreen extends StatefulWidget {
  const CompletingDataScreen({super.key});

  @override
  State<CompletingDataScreen> createState() => _CompletingDataScreenState();
}

class _CompletingDataScreenState extends State<CompletingDataScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CompletingDataCubit, CompletingDataState>(
        listener: (context, state) {
          if (state is CompletingDataSubmitted) {
            setState(() {
              currentPage = 1;
            });
          } else if (state is CompletingDataInitial) {
            setState(() {
              currentPage = 0;
            });
          }
        },
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state is AuthRegisterSuccess) {
              await context.read<AuthCubit>().initialize();
              Navigator.popAndPushNamed(context, "/cashier");
            }
          },
          child: BlocBuilder<CompletingDataCubit, CompletingDataState>(
            builder: (context, completingDataState) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is AuthVerifyOTPSuccessAndRegister ||
                      authState is AuthRegisterFailure) {
                    return SafeArea(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 16),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Flexible(
                                  child: FormStepIndicator(
                                      active: currentPage >= 0),
                                ),
                                const SizedBox(
                                  width: 6.28,
                                ),
                                Flexible(
                                  child: FormStepIndicator(
                                    active: currentPage >= 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (currentPage == 0 &&
                              authState is AuthVerifyOTPSuccessAndRegister)
                            CompletingDataFormPage(
                              phoneNumber: authState.phoneNumber,
                            ),
                          if (currentPage == 1)
                            PinInputPage(
                              isError: authState is AuthRegisterFailure,
                              onPinValid: (value) {
                                if (completingDataState
                                    is CompletingDataSubmitted) {
                                  context.read<AuthCubit>().register(
                                        RegisterDto(
                                          name: completingDataState.name,
                                          email: completingDataState.email,
                                          phoneNumber:
                                              completingDataState.phoneNumber,
                                          pin: value,
                                          outlet: OutletDto(
                                            name:
                                                completingDataState.outletName,
                                            address: completingDataState
                                                .outletAddress,
                                            type:
                                                completingDataState.outletType,
                                          ),
                                        ),
                                      );
                                }
                              },
                            ),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
