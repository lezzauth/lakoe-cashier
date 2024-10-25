import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class FormLabel extends StatelessWidget {
  final String data;
  final bool enabled;
  final bool optional;
  final String sub;
  final String description;

  const FormLabel(
    this.data, {
    super.key,
    this.enabled = true,
    this.optional = false,
    this.sub = "",
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: data,
              style: GoogleFonts.inter(
                color: !enabled
                    ? TColors.neutralDarkLightest
                    : TColors.neutralDarkDark,
                fontSize: TSizes.fontSizeHeading4,
                fontWeight: FontWeight.w600,
              ),
              children: [
                if (optional)
                  TextSpan(
                    text: " (opsional)",
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkLight,
                      fontSize: TSizes.fontSizeBodyS,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                if (sub.isNotEmpty)
                  TextSpan(
                    text: " $sub",
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkLight,
                      fontSize: TSizes.fontSizeBodyS,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: description != "" ? 4 : 0),
          if (description != "")
            TextBodyS(
              description,
              color: TColors.neutralDarkMedium,
            ),
        ],
      ),
      // ),
    );
  }
}
