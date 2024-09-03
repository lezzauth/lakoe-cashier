import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/category_icon_formatter.dart';

class CategoryIconPicker extends StatelessWidget {
  final bool selected;
  final Function()? onSelected;
  final String icon;

  const CategoryIconPicker({
    super.key,
    required this.selected,
    required this.icon,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        // height: 80,
        // width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: selected
                ? TColors.highlightDarkest
                : TColors.neutralLightMedium,
          ),
          borderRadius: BorderRadius.circular(12),
          color: selected ? TColors.highlightLightest : Colors.transparent,
        ),
        child: Container(
          height: 24,
          width: 24,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            TCategoryIconFormatter.getIcon(icon),
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(
              TColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
