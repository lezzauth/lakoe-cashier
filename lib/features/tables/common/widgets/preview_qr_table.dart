import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/helpers/preview_qr_table_helper.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PreviewQrTable extends StatelessWidget {
  final Color color;
  final String data;
  final String tableNumber;

  const PreviewQrTable(this.data,
      {super.key, this.color = TColors.primary, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: TColors.neutralLightDark,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.string(
                        PreviewQrTableHelper.getPreviewQrTable(color),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox.expand(
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            TImages.lakoeLetterWhite,
                            height: 60,
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const TextHeading4(
                                  "No.Meja",
                                  color: TColors.neutralLightLightest,
                                ),
                              ),
                              TextHeading1(
                                tableNumber,
                                color: TColors.neutralLightLightest,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Center(
                child: TextHeading1(
                  "PESAN & BAYAR DISINI",
                  color: color,
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 220,
                  child: QrImageView(
                    data: 'www.google.com',
                    version: QrVersions.auto,
                    errorCorrectionLevel: QrErrorCorrectLevel.H,
                    padding: const EdgeInsets.all(12.0),
                    semanticsLabel: "QR Order",
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: TColors.neutralLightLightest,
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        TImages.lakoeLogoQRIS, // Change with logo merchant
                        scale: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Center(
                child: ResponsiveLayout(
                  mobile: TextHeading3(
                    "CARA PESAN",
                    color: TColors.neutralDarkMedium,
                  ),
                  tablet: TextHeading2(
                    "CARA PESAN",
                    color: TColors.neutralDarkMedium,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UiIcons(
                            TIcons.scanner,
                            color: TColors.neutralDarkMedium,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: ResponsiveLayout(
                              mobile: TextBodyS(
                                "Scan QR order",
                                maxLines: 2,
                                color: TColors.neutralDarkMedium,
                              ),
                              tablet: TextBodyL(
                                "Scan QR order",
                                maxLines: 2,
                                color: TColors.neutralDarkMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UiIcons(
                            TIcons.grid,
                            color: TColors.neutralDarkMedium,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: ResponsiveLayout(
                              mobile: TextBodyS(
                                "Pesan menunya",
                                maxLines: 2,
                                color: TColors.neutralDarkMedium,
                              ),
                              tablet: TextBodyL(
                                "Pesan menunya",
                                maxLines: 2,
                                color: TColors.neutralDarkMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiIcons(
                            TIcons.billChecked,
                            color: TColors.neutralDarkMedium,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: ResponsiveLayout(
                              mobile: TextBodyS(
                                "Bayar pesanan",
                                maxLines: 2,
                                color: TColors.neutralDarkMedium,
                              ),
                              tablet: TextBodyL(
                                "Bayar pesanan",
                                maxLines: 2,
                                color: TColors.neutralDarkMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const TextBodyS(
                    "Supported by",
                    color: TColors.neutralDarkLight,
                  ),
                  SvgPicture.asset(
                    TImages.primaryLogoLakoe,
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
