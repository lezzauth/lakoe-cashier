import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class Grabber extends StatelessWidget {
  const Grabber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: TColors.neutralLightLightest,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          width: 32.0,
          height: 5.0,
          decoration: BoxDecoration(
            color: TColors.neutralLightDark,
            borderRadius: BorderRadius.circular(5.0 / 2),
          ),
        ),
      ),
    );
  }
}
