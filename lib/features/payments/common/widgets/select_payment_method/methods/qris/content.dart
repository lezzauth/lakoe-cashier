import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class QrisPaymentContent extends StatefulWidget {
  const QrisPaymentContent({super.key});

  @override
  State<QrisPaymentContent> createState() => _QrisPaymentContentState();
}

class _QrisPaymentContentState extends State<QrisPaymentContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                horizontalTitleGap: 0,
                child: CheckboxListTile(
                  value: false,
                  onChanged: (value) {},
                  controlAffinity: ListTileControlAffinity.leading,
                  title: TextBodyS(
                    "Cetak QRIS secara otomatis",
                    color: TColors.neutralDarkDarkest,
                  ),
                  dense: true,
                  enableFeedback: false,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/payments/qris");
                    },
                    child: TextActionL("Siapkan QRIS"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
