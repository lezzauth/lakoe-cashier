import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? leading;
  final String title;
  final String? subtitle;
  final ValueChanged<T?> onChanged;
  final BoxDecoration? decoration;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.leading,
    required this.title,
    this.subtitle,
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
          subtitle: TextBodyM(
            subtitle!,
            color: TColors.neutralDarkLightest,
          ),
          leading: leading,
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
