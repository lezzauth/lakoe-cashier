import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TextActionS extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize = TSizes.fontSizeActionS;
  final Color? color;

  const TextActionS(this.data,
      {super.key, this.fontWeight = FontWeight.w600, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.inter(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
