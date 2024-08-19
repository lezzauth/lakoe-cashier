import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:point_of_sales_cashier/common/widgets/form/number_pad.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_event.dart';

import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class PinInputPage extends StatefulWidget {
  final Function(String)? onPinValid;
  final String? title;
  final String? description;
  final bool isDefaultBehaviour;

  const PinInputPage(
      {super.key,
      this.onPinValid,
      this.title,
      this.description,
      this.isDefaultBehaviour = true});

  @override
  State<PinInputPage> createState() => _PinInputPageState();
}

class _PinInputPageState extends State<PinInputPage> {
  final TextEditingController _pinController = TextEditingController();

  Future<void> onPinValidate() async {
    return await Future.delayed(
      Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 16,
      height: 16,
      textStyle: const TextStyle(
        fontSize: 0,
        color: Colors.transparent,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: TColors.neutralLightDark, width: 0),
        borderRadius: BorderRadius.circular(TSizes.inputRadius),
        color: TColors.neutralLightDark,
      ),
      margin: const EdgeInsets.all(
        12.0,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: TColors.primary, width: 0),
      color: TColors.primary,
    );

    return BlocBuilder<CompletingDataPageBloc, CompletingDataPageState>(
      builder: (context, state) => PopScope(
        canPop: !widget.isDefaultBehaviour,
        onPopInvoked: (didPop) {
          if (!didPop) {
            context.read<CompletingDataPageBloc>().add(
                  CompletingDataChangePageEvent(
                    page: CompletingDataPage.businessForm,
                  ),
                );
          }
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
                                widget.title ?? "",
                                style: GoogleFonts.inter(
                                  fontSize: TSizes.fontSizeHeading3,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              widget.description ?? "",
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyS,
                                color: TColors.neutralDarkMedium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme,
                        submittedPinTheme: focusedPinTheme,
                        length: 6,
                        useNativeKeyboard: false,
                        controller: _pinController,
                        onCompleted: (value) async {
                          await onPinValidate();
                          if (widget.onPinValid != null) {
                            widget.onPinValid!(value);
                          }
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
