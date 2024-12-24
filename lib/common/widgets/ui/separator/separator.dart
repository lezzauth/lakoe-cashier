import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    this.height = 1,
    this.color = TColors.neutralDarkDark,
    this.dashWidth = 8.0,
    this.padding = 0.0,
  });

  final double height;
  final Color color;
  final double dashWidth;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
