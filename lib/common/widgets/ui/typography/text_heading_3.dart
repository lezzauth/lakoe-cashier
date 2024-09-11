import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TextHeading3 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeHeading3;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  const TextHeading3(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w700,
    this.color = TColors.neutralDarkDarkest,
    this.maxLines,
    this.overflow,
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
      overflow: overflow,
    );
  }
}
