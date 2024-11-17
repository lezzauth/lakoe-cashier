import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class BankRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T?> onChanged;

  const BankRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () => onChanged(value),
          title: TextHeading4(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: CustomRadio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        const Divider(
          color: TColors.neutralLightMedium,
          indent: 16.0,
          height: 1,
        ),
      ],
    );
  }
}
