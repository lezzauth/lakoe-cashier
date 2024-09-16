import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TextXSmall extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeBodyXS;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isBold;

  const TextXSmall(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w400,
    this.color = TColors.neutralDarkDarkest,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.kosugi(
        color: color,
        fontWeight: isBold ? FontWeight.w700 : fontWeight,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
