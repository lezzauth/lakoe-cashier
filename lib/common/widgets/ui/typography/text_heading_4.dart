import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TextHeading4 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;
  final int? maxLines;

  const TextHeading4(
    this.data, {
    super.key,
    this.fontWeight = FontWeight.w600,
    this.fontSize = TSizes.fontSizeHeading4,
    this.color,
    this.overflow,
    this.softWrap,
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
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
