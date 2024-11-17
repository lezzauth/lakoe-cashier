import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/form/dotted_pin.dart';
import 'package:lakoe_pos/common/widgets/form/number_pad.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/completing_data/completing_data_screen_cubit.dart';

import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

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
  bool loading = false;
  bool isPinNotMatch = false;

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
                      margin: const EdgeInsets.only(bottom: 40, top: 56),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: TextHeading3(
                              !isRepeat
                                  ? "Buat kode akses (PIN)"
                                  : "Masukan ulang kode akses (PIN)",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const TextBodyS(
                            "Kode akses ini akan digunakan untuk setiap kali akan melakukan transaksi.",
                            color: TColors.neutralDarkMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    if (!loading)
                      DottedPin(
                        length: 6,
                        controller: _pinController,
                        onCompleted: (value) async {
                          if (isRepeat) {
                            setState(() {
                              loading = true;
                            });

                            await Future.delayed(Duration(seconds: 1));

                            if (value != firstValue) {
                              setState(() {
                                isPinNotMatch = true;
                                loading = false;
                              });
                              _pinController.clear();
                              return;
                            }

                            setState(() {
                              isPinNotMatch = false;
                            });

                            if (widget.onPinValid != null) {
                              widget.onPinValid!(value);
                            }

                            setState(() {
                              loading = false;
                              isRepeat = false;
                            });
                          } else {
                            setState(() {
                              loading = true;
                            });

                            await Future.delayed(Duration(seconds: 1));

                            setState(() {
                              firstValue = value;
                              isRepeat = true;
                              loading = false;
                            });

                            _pinController.clear();
                          }
                        },
                      ),
                    if (loading)
                      const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(TColors.primary),
                        ),
                      ),
                    if (isPinNotMatch && !loading)
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Text(
                          "Masukan PIN yang sama dengan sebelumnya.",
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
