import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class FormLabel extends StatelessWidget {
  final String data;
  final bool enabled;

  const FormLabel(this.data, {super.key, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(
        data,
        style: GoogleFonts.inter(
          color:
              !enabled ? TColors.neutralDarkLightest : TColors.neutralDarkDark,
          fontSize: TSizes.fontSizeHeading5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
