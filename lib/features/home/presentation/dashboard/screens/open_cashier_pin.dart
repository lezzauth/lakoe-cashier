import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/dotted_pin.dart';
import 'package:point_of_sales_cashier/common/widgets/form/number_pad.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:point_of_sales_cashier/features/home/data/arguments/open_cashier_pin_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class OpenCashierPinScreen extends StatefulWidget {
  const OpenCashierPinScreen({super.key});

  @override
  State<OpenCashierPinScreen> createState() => _OpenCashierPinScreenState();
}

class _OpenCashierPinScreenState extends State<OpenCashierPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  onCompleted(String value, int initialBalance) {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is AuthReady) {
      context.read<CashierCubit>().openCashier(
            OpenCashierDto(
              initialBalance: initialBalance,
              outletId: authState.outletId,
              pin: value,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as OpenCashierPinArgument;

    return BlocListener<CashierCubit, CashierState>(
      listener: (context, state) {
        if (state is CashierOpened) {
          Navigator.popAndPushNamed(context, "/cashier/explore-products");
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 40, top: 56),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: const TextHeading3(
                                "Masukan PIN kamu",
                              ),
                            ),
                            const TextBodyS(
                              "Jika Anda lupa PIN, hubungi manajer Anda",
                              color: TColors.neutralDarkMedium,
                            )
                          ],
                        ),
                      ),
                      DottedPin(
                        length: 4,
                        controller: _pinController,
                        onCompleted: (value) {
                          onCompleted(value, arguments.initialBalance);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: NumberPad(
                  controller: _pinController,
                  maxLength: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(bottom: 40),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 8.0),
//                       child: const TextHeading3(
//                         "Masukan PIN kamu",
//                       ),
//                     ),
//                     const TextBodyS(
//                       "Jika Anda lupa PIN, hubungi manajer Anda",
//                       color: TColors.neutralDarkMedium,
//                     )
//                   ],
//                 ),
//               ),
//               DottedPin(
//                 length: 4,
//                 controller: _pinController,
//                 onCompleted: (value) {
//                   onCompleted(value, 100000);
//                 },
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 24),
//                 child: NumberPad(
//                   controller: _pinController,
//                   maxLength: 6,
//                 ),
//               ),
//             ],
//           ),
//         ),