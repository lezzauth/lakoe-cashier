import 'package:flutter/material.dart';

class SortRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget title;
  final ValueChanged<T?> onChanged;
  final BoxDecoration? decoration;

  const SortRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 52,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title,
            Radio<T>(
              groupValue: groupValue,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
