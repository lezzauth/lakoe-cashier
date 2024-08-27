import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TermsAgreementCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final bool isError;

  const TermsAgreementCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    onTermsPressed() {}
    onPrivacyPressed() {}

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 16.0,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            isError: isError,
            side: WidgetStateBorderSide.resolveWith(
              (states) {
                if (states.contains(WidgetState.error)) {
                  return const BorderSide(
                    color: TColors.error,
                    width: 3,
                    strokeAlign: 1,
                  );
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: 'Saya telah membaca dan menyetujui ',
              style: GoogleFonts.inter(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Syarat & Ketentuan',
                  style: const TextStyle(
                    color: TColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTermsPressed,
                ),
                const TextSpan(
                  text: ' dan ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Kebijakan Privasi',
                  style: const TextStyle(
                    color: TColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onPrivacyPressed,
                ),
                const TextSpan(
                  text: '.',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
