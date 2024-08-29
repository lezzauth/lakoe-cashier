import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class DottedPin extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value)? onCompleted;
  final int length;

  const DottedPin({
    super.key,
    this.controller,
    this.onCompleted,
    required this.length,
  });

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

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme,
      submittedPinTheme: focusedPinTheme,
      length: length,
      useNativeKeyboard: false,
      controller: controller,
      onCompleted: onCompleted,
    );
  }
}
