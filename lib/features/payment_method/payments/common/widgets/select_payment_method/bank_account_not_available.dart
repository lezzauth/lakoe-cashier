import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';

class BankAccountNotAvailable extends StatelessWidget {
  const BankAccountNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TDeviceUtils.getViewInsets(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextHeading2(
                "Oops! Kamu belum menyimpan rekening bank",
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBodyM(
                        "Kamu perlu melengkapi data Rekening Bank kamu agar bisa menggunakan metode pembayaran Transfer Bank.",
                        color: TColors.neutralDarkMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: TextActionL(
                        "Nanti saja",
                        color: TColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/bank_accounts");
                      },
                      child: TextActionL(
                        "Atur Sekarang",
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
