import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class QrisPaymentFooter extends StatelessWidget {
  const QrisPaymentFooter({
    super.key,
    this.onCanceled,
    required this.onSubmitted,
    required this.isFormValid,
  });

  final Function() onSubmitted;
  final Function()? onCanceled;
  final bool isFormValid;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: isFormValid ? onSubmitted : null,
                child: const TextActionL("Selesaikan"),
              ),
            ),
          ],
        ),
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: TColors.neutralLightLightest,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: TColors.neutralLightMedium,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 140,
                  child: OutlinedButton(
                    onPressed: onCanceled,
                    child: const TextActionL(
                      "Batalkan",
                      color: TColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isFormValid ? onSubmitted : null,
                    child: const TextActionL("Selesaikan"),
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
