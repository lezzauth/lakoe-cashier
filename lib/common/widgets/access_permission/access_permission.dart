import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class AccessPermission extends StatelessWidget {
  const AccessPermission({
    super.key,
    required this.description,
    required this.imageSrc,
    required this.title,
    required this.onRequest,
    this.actionTitle,
  });

  final String imageSrc;
  final String title;
  final String description;
  final Function() onRequest;
  final String? actionTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    imageSrc,
                    height: 72.46,
                    width: 100,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: TextHeading2(
                    title,
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                TextBodyM(
                  description,
                  color: TColors.neutralDarkMedium,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onRequest,
                    child: TextActionL(actionTitle ?? "Berikan Izin"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
