import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
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

  void _handleCheckout(BuildContext context) {
    Navigator.pushNamed(
      context,
      "/checkout",
      arguments: {
        'package': package,
        'type': 'package',
        'logo': package.name == "GROW"
            ? TImages.growLogoPackage
            : TImages.proLogoPackage,
        'colorWave':
            package.name == "GROW" ? Color(0xFF00712D) : Color(0xFF9306AF),
        'bgColor':
            package.name == "GROW" ? TColors.successLight : Color(0xFFF4DEF8),
        'packageName': package.name,
        'period': package.period,
        'pricePerMonth': package.pricePerMonth,
        'finalPrice': package.price,
      },
    );
  }

  void _handleUpgrade(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      TImages.growToPro,
                      height: 52,
                    ),
                    SizedBox(height: 16),
                    TextHeading2(
                      "Baca dulu, yuk!",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        text: "Dengan melakukan upgrade ke paket ",
                        style: TextStyle(
                          color: TColors.neutralDarkDark,
                        ),
                        children: [
                          TextSpan(
                            text: "Pro",
                            style: TextStyle(
                              color: TColors.neutralDarkDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ", sisa masa aktif paket ",
                            style: TextStyle(
                              color: TColors.neutralDarkDark,
                            ),
                          ),
                          TextSpan(
                            text: "Grow",
                            style: TextStyle(
                              color: TColors.neutralDarkDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " kamu yang tersisa (jika ada) akan ",
                            style: TextStyle(
                              color: TColors.neutralDarkDark,
                            ),
                          ),
                          TextSpan(
                            text: "dihanguskan",
                            style: TextStyle(
                              color: TColors.neutralDarkDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " dan tidak dapat dikembalikan.",
                            style: TextStyle(
                              color: TColors.neutralDarkDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    TextBodyM(
                      "Apakah kamu yakin ingin upgrade?",
                      color: TColors.neutralDarkDark,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextActionL("Batalkan"),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _handleCheckout(context);
                        },
                        child: TextActionL("Oke! Lanjutkan"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
            ),
            _buildTableRow(
              context,
              5,
              "Logo di struk",
              (currentPackage.name == "LITE") ? 00 : 123,
              123,
              isLast: true,
            ),
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
            onPressed: () {
              (upgradedPackage.name == "PRO" && currentPackage.name == "GROW")
                  ? _handleUpgrade(context)
                  : _handleCheckout(context);
            },
            child: TextActionL((currentPackage.name == "LITE")
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
  int? currentPackage,
  int? upgradedPackage, {
  bool isLast = false,
}) {
  Color backgroundColor = (index % 2 == 0)
      ? TColors.neutralLightLightest
      : TColors.neutralLightLight;

  void openBottomsheetInfoInfinity(BuildContext context, String label) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
  }

  return TableRow(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: isLast
          ? BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
            )
          : null,
    ),
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
            child: (currentPackage == 00)
                ? UiIcons(
                    TIcons.close,
                    size: 12,
                    color: TColors.error,
                  )
                : (currentPackage == 123)
                    ? UiIcons(
                        TIcons.check,
                        size: 24,
                        color: TColors.success,
                      )
                    : TextHeading3(
                        currentPackage.toString(),
                        color: TColors.neutralDarkLight,
                      ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
        child: GestureDetector(
          onTap: () {
            if (upgradedPackage == null) {
              openBottomsheetInfoInfinity(context, label);
            }
          },
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
              child: upgradedPackage != null &&
                      upgradedPackage != 0 &&
                      upgradedPackage != 123
                  ? TextHeading3(
                      upgradedPackage.toString(),
                      color: TColors.neutralDarkDark,
                    )
                  : (upgradedPackage == 00)
                      ? UiIcons(
                          TIcons.close,
                          size: 12,
                          color: TColors.error,
                        )
                      : (upgradedPackage == 123)
                          ? UiIcons(
                              TIcons.check,
                              size: 24,
                              color: TColors.success,
                            )
                          : UiIcons(
                              TIcons.infinity,
                              size: 20,
                              color: TColors.neutralDarkDark,
                              onTap: () {
                                openBottomsheetInfoInfinity(context, label);
                              },
                            ),
            ),
          ),
        ),
      ),
    ],
  );
}
