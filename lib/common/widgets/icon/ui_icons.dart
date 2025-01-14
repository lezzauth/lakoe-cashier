import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiIcons extends StatelessWidget {
  final String assetName;
  final double size;
  final Function()? onTap;
  final Color color;
  final BoxFit fit;

  const UiIcons(
    this.assetName, {
    super.key,
    this.size = 24,
    this.onTap,
    this.color = Colors.black,
    this.fit = BoxFit.scaleDown,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: SvgPicture.asset(
        assetName,
        height: size,
        width: size,
        fit: fit,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
