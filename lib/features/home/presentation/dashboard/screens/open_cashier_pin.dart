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

  String messsageError = "PIN Salah. Coba Lagi.";
  bool checkPIN = false;
  bool isPinWrong = false;
  bool isListenerActive = true;

  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      if (isPinWrong) {
        setState(() {
          isPinWrong = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

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
        if (!isListenerActive) return;

        if (state is CashierOpenInProgress) {
          setState(() {
            checkPIN = true;
            isPinWrong = false;
          });
        } else if (state is CashierOpenFailure) {
          _pinController.clear();

          setState(() {
            checkPIN = false;
            isPinWrong = true;
            messsageError = arguments is OpenCashierReInitial
                ? "Kamu tidak memiliki akses ke kasir."
                : "PIN Salah. Coba Lagi.";
          });
        } else if (state is CashierOpened) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/cashier/explore-products",
            (route) => false,
          );
        }
      },
      child: PopScope(
        onPopInvokedWithResult: (popDisposition, popResult) async {
          setState(() {
            isListenerActive = false;
          });

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/cashier",
              (route) => false,
            );
          });
          return Future.value(null);
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
                                "Masukin PIN kasir yang sedang bertugas",
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  TColors.primary),
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
                              messsageError,
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
      ),
    );
  }
}
