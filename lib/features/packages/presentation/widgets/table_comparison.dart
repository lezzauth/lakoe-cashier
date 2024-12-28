import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class PackageComparisonTable extends StatelessWidget {
  const PackageComparisonTable({
    super.key,
    required this.package,
    required this.currentPackage,
    required this.upgradedPackage,
  });

  final PackagePriceModel package;
  final PackageModel currentPackage;
  final PackageModel upgradedPackage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1.5),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              children: [
                Container(),
                Container(
                  decoration: BoxDecoration(
                    color: TColors.neutralLightLight,
                    border: Border(
                      left: BorderSide(
                        color: TColors.neutralLightMedium,
                        width: 1.0,
                      ),
                      top: BorderSide(
                        color: TColors.neutralLightMedium,
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: TColors.neutralLightMedium,
                        width: 1.0,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0), // Radius sudut kiri atas
                      topRight:
                          Radius.circular(12.0), // Radius sudut kanan atas
                    ),
                  ),
                  margin: EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Center(
                    child: Image.asset(
                      currentPackage.name == "LITE"
                          ? TImages.liteLogoLow
                          : currentPackage.name == "GROW"
                              ? TImages.growLogoLow
                              : TImages.proLogoLow,
                      height: 20,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: TColors.neutralLightLight,
                    border: Border(
                      left: BorderSide(
                        color: TColors.highlightDarkest,
                        width: 2.0,
                      ),
                      top: BorderSide(
                        color: TColors.highlightDarkest,
                        width: 2.0,
                      ),
                      right: BorderSide(
                        color: TColors.highlightDarkest,
                        width: 2.0,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0), // Radius sudut kiri atas
                      topRight:
                          Radius.circular(12.0), // Radius sudut kanan atas
                    ),
                  ),
                  margin: EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Center(
                    child: Image.asset(
                      upgradedPackage.name == "LITE"
                          ? TImages.liteLogoPackage
                          : upgradedPackage.name == "GROW"
                              ? TImages.growLogoPackage
                              : TImages.proLogoPackage,
                      height: 20,
                      // height: 20,
                    ),
                  ),
                ),
              ],
            ),
            _buildTableRow(
              context,
              0,
              "Transaksi perhari",
              currentPackage.orders,
              upgradedPackage.orders,
            ),
            _buildTableRow(
              context,
              1,
              "Data menu/produk",
              currentPackage.products,
              upgradedPackage.products,
            ),
            _buildTableRow(
              context,
              2,
              "Data Karyawan",
              currentPackage.employees,
              upgradedPackage.employees,
            ),
            _buildTableRow(
              context,
              3,
              "Data Pelanggan",
              currentPackage.customers,
              upgradedPackage.customers,
            ),
            _buildTableRow(
              context,
              4,
              "Data Meja",
              currentPackage.tables,
              upgradedPackage.tables,
              isLast: true,
            ),
            // _buildTableRow(
            //   context,
            //   5,
            //   "Integrasi Perangkat",
            //   currentPackage.hardwareIntergation,
            //   upgradedPackage.hardwareIntergation,
            // ),
            // _buildTableRow(
            //   context,
            //   6,
            //   "Omni Channel",
            //   0,
            //   null,
            //   isLast: true,
            // ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              "/checkout",
              arguments: {
                'type': 'package',
                'logo': upgradedPackage.name == "GROW"
                    ? TImages.growLogoPackage
                    : TImages.proLogoPackage,
                'colorWave': upgradedPackage.name == "GROW"
                    ? Color(0xFF00712D)
                    : Color(0xFF9306AF),
                'bgColor': upgradedPackage.name == "GROW"
                    ? TColors.successLight
                    : Color(0xFFF4DEF8),
                'packageName': upgradedPackage.name,
                'period': upgradedPackage.period,
                'pricePerMonth': upgradedPackage.pricePerMonth,
                'finalPrice': upgradedPackage.price,
              },
            ),
            child: TextActionL((upgradedPackage.name == "LITE")
                ? "Langganan Sekarang"
                : "Upgrade Sekarang"),
          ),
        ),
      ],
    );
  }
}

TableRow _buildTableRow(
  BuildContext context,
  int index,
  String label,
  int? liteValue,
  int? upgradedValue, {
  bool isLast = false,
}) {
  Color backgroundColor = (index % 2 == 0)
      ? TColors.neutralLightLightest
      : TColors.neutralLightLight;

  return TableRow(
    decoration: BoxDecoration(color: backgroundColor),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: TextHeading4(
            label,
            color: TColors.neutralDarkDark,
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: TColors.neutralLightMedium,
                width: 1.0,
              ),
              right: BorderSide(
                color: TColors.neutralLightMedium,
                width: 1.0,
              ),
              bottom: isLast
                  ? BorderSide(
                      color: TColors.neutralLightMedium,
                      width: 1.0,
                    )
                  : BorderSide.none,
            ),
            borderRadius: isLast
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  )
                : null,
          ),
          margin: EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: Center(
            child: TextHeading3(
              liteValue.toString(),
              color: TColors.neutralDarkLight,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: TColors.highlightDarkest,
                width: 2.0,
              ),
              right: BorderSide(
                color: TColors.highlightDarkest,
                width: 2.0,
              ),
              bottom: isLast
                  ? BorderSide(
                      color: TColors.highlightDarkest,
                      width: 2.0,
                    )
                  : BorderSide.none,
            ),
            borderRadius: isLast
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  )
                : null,
          ),
          margin: EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: Center(
            child: upgradedValue != null
                ? TextHeading3(
                    upgradedValue.toString(),
                    color: TColors.neutralDarkDark,
                  )
                : UiIcons(
                    TIcons.infinity,
                    size: 20,
                    color: TColors.neutralDarkDark,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return CustomBottomsheet(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        TImages.infinity,
                                        height: 32,
                                      ),
                                      SizedBox(height: 16),
                                      TextHeading3(
                                        label,
                                        color: TColors.neutralDarkDark,
                                      ),
                                      SizedBox(height: 4),
                                      TextBodyM(
                                        "Dengan kamu membeli paket Lakoe Pro, kamu bisa menambah ${label.toLowerCase()} tanpa batas.",
                                        color: TColors.neutralDarkDark,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: TextActionL("Oke! Paham"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ),
      ),
    ],
  );
}
