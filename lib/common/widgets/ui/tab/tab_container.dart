import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TabContainer extends StatelessWidget implements PreferredSizeWidget {
  const TabContainer({
    super.key,
    required this.tabs,
    this.controller,
    this.hasPadding = false,
  });

  final List<Widget> tabs;
  final TabController? controller;
  final bool? hasPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hasPadding == true ? 0 : 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          height: 48.0,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: TColors.neutralLightLight,
            border: Border.all(color: TColors.neutralLightMedium, width: 1),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TabBar(
            controller: controller,
            tabs: tabs,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
