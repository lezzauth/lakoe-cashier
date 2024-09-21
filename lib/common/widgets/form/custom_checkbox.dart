import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color borderColor;
  final Color selectedColor;
  final Color checkColor;
  final Duration animationDuration;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.size = 24.0, // Ukuran default kotak checkbox
    this.borderColor = TColors.neutralLightDarkest,
    this.selectedColor = TColors.primary,
    this.checkColor = TColors.neutralLightLightest,
    this.animationDuration =
        const Duration(milliseconds: 300), // Durasi animasi
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: widget.animationDuration, // Menambahkan animasi transisi
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.value ? widget.selectedColor : widget.borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
          color: widget.value ? widget.selectedColor : Colors.transparent,
        ),
        child: widget.value
            ? AnimatedOpacity(
                opacity: 1.0,
                duration: widget.animationDuration,
                child: Icon(
                  Icons.check,
                  size: widget.size * 0.6, // Ukuran ikon check
                  color: widget.checkColor,
                ),
              )
            : AnimatedOpacity(
                opacity: 0.0,
                duration: widget.animationDuration,
                child: UiIcons(
                  TIcons.check,
                  width: widget.size * 0.2,
                  height: widget.size * 0.2,
                  color: widget.checkColor,
                ),
              ),
      ),
    );
  }
}
