import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TabContainer extends StatelessWidget implements PreferredSizeWidget {
  const TabContainer({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          height: 48,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: TColors.neutralLightLight,
            border: Border.all(color: TColors.neutralLightMedium, width: 1),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TabBar(
            tabs: tabs,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
