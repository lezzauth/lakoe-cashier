import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiIcons extends StatelessWidget {
  final String assetName;
  final double height;
  final double width;
  final Function()? onTap;
  final Color color;

  const UiIcons(
    this.assetName, {
    super.key,
    this.height = 24,
    this.width = 24,
    this.onTap,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(height * width)),
      child: GestureDetector(
        child: SvgPicture.asset(
          assetName,
          height: height,
          width: width,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    );
  }
}
