import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class DebitPaymentFooter extends StatelessWidget {
  const DebitPaymentFooter({
    super.key,
    required this.onSubmitted,
    this.onCanceled,
  });

  final Function() onSubmitted;
  final Function()? onCanceled;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: onSubmitted,
                  child: const TextActionL("Selesaikan"),
                ),
              ),
            ),
          ],
        ),
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
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
                  height: 48,
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
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: onSubmitted,
                      child: const TextActionL("Selesaikan"),
                    ),
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
