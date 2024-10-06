import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/form/dotted_pin.dart';
import 'package:point_of_sales_cashier/common/widgets/form/number_pad.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:point_of_sales_cashier/features/home/data/arguments/open_cashier_pin_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class OpenCashierPinScreen extends StatefulWidget {
  const OpenCashierPinScreen({super.key});

  @override
  State<OpenCashierPinScreen> createState() => _OpenCashierPinScreenState();
}

class _OpenCashierPinScreenState extends State<OpenCashierPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  bool checkPIN = false;
  bool isPinWrong = false;

  onOpenCashierInitial(String value, int initialBalance) {
    context.read<CashierCubit>().openCashier(
          OpenCashierDto(
            initialBalance: initialBalance,
            pin: value,
          ),
        );
  }

  onOpenCashierReInitial(String value) {
    context.read<CashierCubit>().generatetoken(
          RegenerateCashierTokenDto(pin: value),
        );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as OpenCashierPinArgument;

    return BlocListener<CashierCubit, CashierState>(
      listener: (context, state) {
        if (state is CashierOpenInProgress) {
          setState(() {
            checkPIN = true;
          });
        } else if (state is CashierOpenFailure) {
          _pinController.clear();
          setState(() {
            isPinWrong = true;
          });
        } else if (state is CashierOpened) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/cashier/explore-products",
            (route) => false,
          );
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
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 40, top: 56),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: const TextHeading3(
                                "Masukan PIN kamu",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const TextBodyS(
                              "Jika Anda lupa PIN, hubungi manajer Anda",
                              color: TColors.neutralDarkMedium,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      if (checkPIN && !isPinWrong)
                        const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(TColors.primary),
                          ),
                        ),
                      if (!checkPIN || isPinWrong)
                        DottedPin(
                          length: 6,
                          controller: _pinController,
                          onCompleted: (value) {
                            setState(() {
                              checkPIN = false;
                              isPinWrong = false;
                            });
                            if (arguments is OpenCashierInitial) {
                              onOpenCashierInitial(
                                  value, arguments.initialBalance);
                            }
                            if (arguments is OpenCashierReInitial) {
                              onOpenCashierReInitial(value);
                            }
                          },
                        ),
                      if (isPinWrong)
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Text(
                            "PIN Salah. Coba Lagi.",
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyS,
                              color: TColors.error,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
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
