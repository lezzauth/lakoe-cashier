import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isError;
  final double size;
  final Color borderColor;
  final Color selectedColor;
  final Color checkColor;
  final Duration animationDuration;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.isError = false,
    this.size = 24.0,
    this.borderColor = TColors.neutralLightDarkest,
    this.selectedColor = TColors.primary,
    this.checkColor = TColors.neutralLightLightest,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: widget.animationDuration,
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isError
                ? TColors.error
                : widget.value
                    ? widget.selectedColor
                    : widget.borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
          color: widget.value ? widget.selectedColor : Colors.transparent,
        ),
        child: widget.value
            ? AnimatedOpacity(
                opacity: 1.0,
                duration: widget.animationDuration,
                child: UiIcons(
                  TIcons.check,
                  size: widget.size * 0.9,
                  color: widget.isError ? TColors.error : widget.checkColor,
                ),
              )
            : AnimatedOpacity(
                opacity: 0.0,
                duration: widget.animationDuration,
                child: UiIcons(
                  TIcons.check,
                  size: widget.size * 0.2,
                  color: Colors.transparent,
                ),
              ),
      ),
    );
  }
}
