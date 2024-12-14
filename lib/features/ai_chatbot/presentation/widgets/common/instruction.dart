import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class Instruction extends StatelessWidget {
  const Instruction({super.key, required this.no, required this.text});

  final int no;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBodyS(
          '$no. ',
          color: TColors.neutralDarkLight,
        ),
        Expanded(child: text),
      ],
    );
  }
}
