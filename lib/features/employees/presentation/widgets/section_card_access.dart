import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class AccessRightsSectionCard extends StatelessWidget {
  final List<Widget> children;
  const AccessRightsSectionCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
