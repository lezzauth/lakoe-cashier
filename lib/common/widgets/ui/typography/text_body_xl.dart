import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TextBodyXL extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeBodyXL;
  final Color? color;
  final TextAlign? textAlign;

  const TextBodyXL(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
