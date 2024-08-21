import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TextBodyM extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeBodyM;
  final Color? color;
  final TextAlign? textAlign;

  const TextBodyM(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
    );
  }
}
