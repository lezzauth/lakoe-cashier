import 'package:flutter/material.dart';

class BankRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget title;
  final ValueChanged<T?> onChanged;
  final BoxDecoration? decoration;

  const BankRadioTile({
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
        padding: const EdgeInsets.only(left: 16, right: 4),
        height: 48,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: title),
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
