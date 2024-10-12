import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TextActionL extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeActionL;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;

  const TextActionL(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w600,
    this.color,
    this.maxLines,
    this.textAlign,
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
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
