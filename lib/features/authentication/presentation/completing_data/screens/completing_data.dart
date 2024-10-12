import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_form_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_screen_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_screen_state.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/completing_data_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/completing_data_form_page.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/form_step_indicator.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/widgets/pin_input_page.dart';

class CompletingDataScreen extends StatelessWidget {
  const CompletingDataScreen({super.key, required this.arguments});

  final CompletingDataArgument arguments;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CompletingDataScreenCubit()),
        BlocProvider(create: (context) => CompletingDataCubit()),
        BlocProvider(create: (context) => CompletingDataFormCubit()),
      ],
      child: CompletingData(arguments: arguments),
    );
  }
}

class CompletingData extends StatefulWidget {
  const CompletingData({super.key, required this.arguments});

  final CompletingDataArgument arguments;

  @override
  State<CompletingData> createState() => _CompletingDataState();
}

class _CompletingDataState extends State<CompletingData> {
  Widget _buildPage(int currentPage) {
    final formState = context.read<CompletingDataFormCubit>().state;
    final state = context.read<CompletingDataCubit>().state;
    final formValue = formState.value;

    if (currentPage == 1) {
      final outletPinpoint = formValue["outletPinpoint"] as LatLng;
      return PinInputPage(
        isError: state is CompletingDataActionFailure,
        onPinValid: (value) {
          context.read<CompletingDataCubit>().register(
                RegisterDto(
                  name: formValue["name"],
                  email: formValue["email"],
                  phoneNumber: formValue["phoneNumber"],
                  pin: value,
                  outlet: OutletDto(
                    name: formValue["outletName"],
                    address: formValue["outletAddress"],
                    type: formValue["outletType"],
                    latitude: outletPinpoint.latitude,
                    longitude: outletPinpoint.longitude,
                  ),
                ),
              );
        },
      );
    }

    return CompletingDataFormPage(
      initialValue: {
        "phoneNumber": widget.arguments.phoneNumber,
        "outletType": formValue["outletType"] ?? "Kuliner",
        "name": formValue["name"],
        "email": formValue["email"],
        "outletName": formValue["outletName"],
        "outletAddress": formValue["outletAddress"],
      },
      onSubmitted: () {
        context.read<CompletingDataScreenCubit>().goToPinInputPage();
      },
    );
  }

  Widget _buildPageIndicator(int currentPage) {
    return Row(
      children: [
        Expanded(
          child: FormStepIndicator(
            active: true,
          ),
        ),
        const SizedBox(
          width: 6.28,
        ),
        Expanded(
          child: FormStepIndicator(
            active: currentPage >= 1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<CompletingDataCubit, CompletingDataState>(
            listener: (context, state) async {
              if (state is CompletingDataActionSuccess) {
                await context.read<AuthCubit>().initialize();

                if (!context.mounted) return;
                Navigator.popAndPushNamed(context, "/cashier");
              }
            },
          )
        ],
        child:
            BlocBuilder<CompletingDataScreenCubit, CompletingDataScreenState>(
          builder: (context, pageState) {
            final currentPage = pageState.page;

            return SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    child: _buildPageIndicator(currentPage),
                  ),
                  _buildPage(currentPage)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
