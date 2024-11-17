import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class CustomRadio<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? TColors.primary : TColors.neutralLightMedium,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: selected
              ? const Icon(Icons.circle,
                  size: 10,
                  color: TColors.neutralLightLightest,
                  key: ValueKey(true))
              : const Icon(Icons.circle,
                  size: 24,
                  color: TColors.neutralLightLightest,
                  key: ValueKey(false)),
        ),
      ),
    );
  }
}
