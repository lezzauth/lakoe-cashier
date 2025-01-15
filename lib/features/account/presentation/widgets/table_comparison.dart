import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
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

class PackageComparisonTable extends StatefulWidget {
  const PackageComparisonTable({
    super.key,
    required this.packages,
    required this.peviousPackage,
    required this.currentPackage,
  });

  final List<PackagePriceModel> packages;
  final PackageModel peviousPackage;
  final PackageModel currentPackage;

  @override
  State<PackageComparisonTable> createState() => _PackageComparisonTableState();
}

class _PackageComparisonTableState extends State<PackageComparisonTable> {
  void _openModalBottomSheet(BuildContext context) {
    String? selectedPeriod;
    PackagePriceModel selectedPackage = widget.packages[2];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomBottomsheet(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: const TextHeading2(
                        "Diperpanjang berapa lama?",
                      ),
                    ),
                    ...widget.packages.map((data) {
                      return CardListPeriod<String?>(
                        package: data,
                        value: data.period.toString(),
                        groupValue: selectedPeriod ?? "6",
                        onChanged: (value) {
                          setState(() {
                            selectedPeriod = value;
                            selectedPackage = data;
                          });
                        },
                      );
                    }),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/checkout",
                            arguments: {
                              'package': selectedPackage,
                              'type': 'package',
                              'logo': selectedPackage.name == "GROW"
                                  ? TImages.growLogoPackage
                                  : TImages.proLogoPackage,
                              'colorWave': selectedPackage.name == "GROW"
                                  ? Color(0xFF00712D)
                                  : Color(0xFF9306AF),
                              'bgColor': selectedPackage.name == "GROW"
                                  ? TColors.successLight
                                  : Color(0xFFF4DEF8),
                              'packageName': selectedPackage.name,
                              'period': selectedPackage.period,
                              'pricePerMonth': selectedPackage.pricePerMonth,
                              'finalPrice': selectedPackage.price,
                            },
                          );
                        },
                        child: TextActionL("Lanjutkan"),
                      ),
                    ),
                  ],
                ),
              );
            },
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
              decoration: BoxDecoration(color: Colors.transparent),
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
                      widget.peviousPackage.name == "LITE"
                          ? TImages.liteLogoLow
                          : widget.peviousPackage.name == "GROW"
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
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Center(
                    child: Image.asset(
                      widget.currentPackage.name == "LITE"
                          ? TImages.liteLogoPackage
                          : widget.currentPackage.name == "GROW"
                              ? TImages.growLogoPackage
                              : TImages.proLogoPackage,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            _buildTableRow(
              context,
              0,
              "Transaksi perhari",
              widget.peviousPackage.orders,
              widget.currentPackage.orders,
            ),
            _buildTableRow(
              context,
              1,
              "Data menu/produk",
              widget.peviousPackage.products,
              widget.currentPackage.products,
            ),
            _buildTableRow(
              context,
              2,
              "Data Karyawan",
              widget.peviousPackage.employees,
              widget.currentPackage.employees,
            ),
            _buildTableRow(
              context,
              3,
              "Data Pelanggan",
              widget.peviousPackage.customers,
              widget.currentPackage.customers,
            ),
            _buildTableRow(
              context,
              4,
              "Data Meja",
              widget.peviousPackage.tables,
              widget.currentPackage.tables,
            ),
            _buildTableRow(
              context,
              5,
              "Logo di struk",
              (widget.peviousPackage.name == "LITE") ? 00 : 123,
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
          height: 46,
          child: OutlinedButton(
            onPressed: () => _openModalBottomSheet(context),
            child: TextActionL("Perpanjang"),
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
  int? peviousPackage,
  int? currentPackage, {
  bool isLast = false,
}) {
  Color backgroundColor = (index % 2 == 0)
      ? TColors.neutralLightLightest
      : TColors.neutralLightLight;

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
            child: (peviousPackage == 00)
                ? UiIcons(
                    TIcons.close,
                    size: 12,
                    color: TColors.error,
                  )
                : (peviousPackage == 123)
                    ? UiIcons(
                        TIcons.check,
                        size: 24,
                        color: TColors.success,
                      )
                    : TextHeading3(
                        peviousPackage.toString(),
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
            child: currentPackage != null &&
                    currentPackage != 0 &&
                    currentPackage != 123
                ? TextHeading3(
                    currentPackage.toString(),
                    color: TColors.neutralDarkDark,
                  )
                : (currentPackage == 00)
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

class CardListPeriod<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final PackagePriceModel package;

  const CardListPeriod({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.package,
  });

  @override
  Widget build(BuildContext context) {
    final title = package.period == 12 ? "1 Tahun" : "${package.period} Bulan";
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: TColors.neutralLightLightest,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: TColors.neutralLightDark,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomRadio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
                SizedBox(width: 12),
                TextHeading3(
                  title,
                  color: TColors.neutralDarkDark,
                ),
                SizedBox(width: 8),
                if (package.discount != 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: TColors.errorLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextHeading5(
                      "${package.discount}%",
                      color: TColors.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                TextHeading3(
                  TFormatter.formatToRupiah(package.pricePerMonth),
                  color: TColors.neutralDarkDark,
                  fontWeight: FontWeight.w700,
                ),
                TextBodyS(
                  "/bulan",
                  color: TColors.neutralDarkLightest,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
