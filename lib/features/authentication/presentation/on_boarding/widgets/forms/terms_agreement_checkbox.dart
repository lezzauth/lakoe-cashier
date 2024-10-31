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
          onChanged: (newValue) {
            FocusScope.of(context).unfocus();
            onChanged(newValue);
          },
        ),
        const SizedBox(width: 12),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: 'Saya telah membaca dan menyetujui ',
              style: GoogleFonts.inter(
                color: TColors.neutralDarkDark,
              ),
              children: [
                TextSpan(
                  text: 'Syarat & Ketentuan',
                  style: GoogleFonts.inter(
                    color: TColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTermsPressed,
                ),
                TextSpan(
                  text: ' dan ',
                  style: GoogleFonts.inter(
                    color: TColors.neutralDarkDark,
                  ),
                ),
                TextSpan(
                  text: 'Kebijakan Privasi',
                  style: GoogleFonts.inter(
                    color: TColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onPrivacyPressed,
                ),
                TextSpan(
                  text: '.',
                  style: GoogleFonts.inter(
                    color: TColors.neutralDarkDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
