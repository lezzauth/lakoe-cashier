import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CustomRadio<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? TColors.primary : TColors.neutralLightMedium,
        ),
        child: Icon(
          Icons.circle,
          size: selected ? 10 : 26,
          color: TColors.neutralLightLightest,
        ),
      ),
    );
  }
}
