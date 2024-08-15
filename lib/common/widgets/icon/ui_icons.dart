import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiIcons extends StatelessWidget {
  final String assetName;
  final double height;
  final double width;
  final Function()? onTap;

  const UiIcons(
    this.assetName, {
    super.key,
    this.height = 24,
    this.width = 24,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        height: height,
        width: height,
      ),
    );
  }
}
