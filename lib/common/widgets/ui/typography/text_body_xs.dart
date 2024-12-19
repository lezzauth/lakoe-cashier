import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TextBodyXS extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeBodyXS;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;

  const TextBodyXS(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.overflow,
    this.maxLines,
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
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
