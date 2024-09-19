import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/custom_radio.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class SortRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () => onChanged(value),
          title: TextBodyL(
            title,
            color: TColors.neutralDarkDarkest,
          ),
          trailing: CustomRadio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        const Divider(
          color: TColors.neutralLightMedium,
          indent: 20.0,
          height: 1,
        ),
      ],
    );
  }
}
