import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';

class InfoBagdeStatus extends StatelessWidget {
  const InfoBagdeStatus({super.key, this.isStrong = true});

  final bool isStrong;

  @override
  Widget build(BuildContext context) {
    final orderStatusDescriptions = [
      {
        "status": "Selesai",
        "tag": "COMPLETED",
        "description":
            "Pesanan telah selesai sepenuhnya dan sudah dibayar oleh pelanggan.",
      },
      {
        "status": "Berlangsung",
        "tag": "OPEN",
        "description":
            "Pesanan ini masih ada dalam daftar kasir yang bertugas. Biasanya karena belum dibayar atau masih dalam proses penyelesaian.",
      },
      {
        "status": "Terhutang",
        "tag": "CLOSED",
        "description":
            "Pesanan ini sudah keluar dari daftar kasir (tutup kasir), tetapi masih memiliki tagihan atau belum diselesaikan sepenuhnya.",
      },
      {
        "status": "Dibatalkan",
        "tag": "CANCELLED",
        "description":
            "Pesanan telah dibatalkan oleh sistem atau kasir, sehingga tidak akan diproses lebih lanjut.",
      },
    ];

    Color getTagBackgroundColor(String tag) {
      switch (tag) {
        case "OPEN":
          return isStrong ? TColors.info : TColors.infoLight;
        case "CLOSED":
          return isStrong ? TColors.error : TColors.errorLight;
        case "COMPLETED":
          return isStrong ? TColors.success : TColors.successLight;
        case "CANCELLED":
          return isStrong ? TColors.neutralDarkDark : TColors.neutralLightDark;
        default:
          return isStrong ? TColors.info : TColors.infoLight;
      }
    }

    Color getTagTextColor(String tag) {
      switch (tag) {
        case "OPEN":
          return TColors.info;
        case "CLOSED":
          return TColors.error;
        case "COMPLETED":
          return TColors.success;
        case "CANCELLED":
          return TColors.neutralDarkDarkest;
        default:
          return TColors.info;
      }
    }

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
                "Apa sih arti dari setiap status?",
              ),
            ),
            SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderStatusDescriptions.length,
              itemBuilder: (context, index) {
                final statusData = orderStatusDescriptions[index];
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextHeading4(
                            "${index + 1}.",
                            color: TColors.neutralDarkMedium,
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: getTagBackgroundColor(statusData["tag"]!),
                            ),
                            child: TextHeading5(
                              statusData["status"]!,
                              color: !isStrong
                                  ? getTagTextColor(statusData["tag"]!)
                                  : TColors.neutralLightLightest,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      TextBodyM(
                        statusData["description"]!,
                        color: TColors.neutralDarkMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 48,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextActionL("Oke! Paham"),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
