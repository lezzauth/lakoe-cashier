import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/form/dotted_pin.dart';
import 'package:point_of_sales_cashier/common/widgets/form/number_pad.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_screen_cubit.dart';

import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class PinInputPage extends StatefulWidget {
  final Function(String)? onPinValid;
  final bool isError;

  const PinInputPage({
    super.key,
    this.onPinValid,
    this.isError = false,
  });

  @override
  State<PinInputPage> createState() => _PinInputPageState();
}

class _PinInputPageState extends State<PinInputPage> {
  final TextEditingController _pinController = TextEditingController();
  String firstValue = "";
  bool isRepeat = false;
  bool isPinWrong = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<CompletingDataScreenCubit>().goToFormPage();
      },
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 23.5),
                margin: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              !isRepeat
                                  ? "Buat kode akses (PIN)"
                                  : "Masukan ulang kode akses (PIN)",
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeHeading3,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            "Kode akses ini akan digunakan untuk setiap kali akan melakukan transaksi.",
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyS,
                              color: TColors.neutralDarkMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    DottedPin(
                      length: 6,
                      controller: _pinController,
                      onCompleted: (value) {
                        if (isRepeat) {
                          if (value != firstValue) {
                            setState(() {
                              isPinWrong = true;
                            });
                            _pinController.clear();

                            return;
                          }

                          setState(() {
                            isPinWrong = false;
                          });
                          if (widget.onPinValid != null) {
                            widget.onPinValid!(value);
                          }
                        }

                        setState(() {
                          firstValue = value;
                          isRepeat = true;
                        });
                        _pinController.clear();
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
                isShowForgot: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
