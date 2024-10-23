import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/form/custom_checkbox.dart';
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
    onTermsPressed() {
      Navigator.pushNamed(context, "/terms_conditions");
    }

    onPrivacyPressed() {
      Navigator.pushNamed(context, "/privacy_policy");
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckbox(
          value: value,
          isError: isError,
          onChanged: onChanged,
        ),
        const SizedBox(width: 12),
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
