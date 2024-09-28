import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/light_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class GrowPackageDetailScreen extends StatefulWidget {
  const GrowPackageDetailScreen({super.key});

  @override
  State<GrowPackageDetailScreen> createState() =>
      _GrowPackageDetailScreenState();
}

class _GrowPackageDetailScreenState extends State<GrowPackageDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;

  List<_PackagesDetail> listPeriodPackage = [
    _PackagesDetail(
      period: "1",
      pricePerMonth: 30000,
      discount: 0,
      finalPrice: 30000,
      originPrice: 30000,
    ),
    _PackagesDetail(
      period: "3",
      pricePerMonth: 27000,
      discount: 10,
      finalPrice: 81000,
      originPrice: 90000,
    ),
    _PackagesDetail(
      period: "6",
      pricePerMonth: 24000,
      discount: 20,
      finalPrice: 144000,
      originPrice: 180000,
    ),
    _PackagesDetail(
      period: "12",
      pricePerMonth: 18000,
      discount: 40,
      finalPrice: 216000,
      originPrice: 360000,
    ),
  ];

  List<_QuotaPackages> listQuotaPackage = [
    _QuotaPackages(
      item: "Kuota transaksi perhari",
      liteQuota: "20",
      upgradeQuota: "50",
      frequency: "daily",
    ),
    _QuotaPackages(
      item: "Kuota menu/produk",
      liteQuota: "10",
      upgradeQuota: "25",
    ),
    _QuotaPackages(
      item: "Karyawan",
      liteQuota: "2",
      upgradeQuota: "5",
    ),
    _QuotaPackages(
      item: "Pelanggan",
      liteQuota: "20",
      upgradeQuota: "40",
    ),
    _QuotaPackages(
      item: "QR Meja",
      liteQuota: "5",
      upgradeQuota: "15",
    ),
    _QuotaPackages(
      item: "Integrasi Perangkat",
      liteQuota: "1",
      upgradeQuota: "2",
    ),
    _QuotaPackages(
      item: "Omni Channel",
      liteQuota: "1",
      upgradeQuota: "3",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbarLight(
        title: "Detail Paket",
      ),
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 246,
              child: SvgPicture.asset(
                TImages.growLevelHero,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 120),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      TImages.lakoeXGrow,
                      height: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      color: TColors.neutralLightLightest,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        TabContainer(
                          hasPadding: true,
                          controller: _tabController,
                          tabs: [
                            TabItem(title: "1 Bulan"),
                            TabItem(title: "3 Bulan"),
                            TabItem(title: "6 Bulan"),
                            TabItem(title: "1 Tahun"),
                          ],
                        ),
                        TabViewPackage(
                          packageData: listPeriodPackage,
                          quota: listQuotaPackage,
                          index: _selectedIndex,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabViewPackage extends StatelessWidget {
  const TabViewPackage({
    super.key,
    required this.packageData,
    required this.quota,
    required this.index,
  });

  // ignore: library_private_types_in_public_api
  final List<_PackagesDetail> packageData;
  final List<_QuotaPackages> quota;
  final int index;

  @override
  Widget build(BuildContext context) {
    final package = packageData[index];
    return Column(
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextHeading1(
                    TFormatter.formatToRupiah(package.pricePerMonth),
                    color: TColors.neutralDarkDarkest,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(width: 4),
                  const TextBodyL(
                    "/bulan",
                    color: TColors.neutralDarkLightest,
                  ),
                  const SizedBox(width: 4),
                  if (package.discount != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: TColors.errorLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextHeading5(
                        "Diskon ${package.discount}%",
                        color: TColors.error,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              if (package.discount == 0)
                const TextBodyL(
                  "Cocok buat bisnis yang mulai tumbuh",
                  color: TColors.neutralDarkLightest,
                ),
              if (package.discount != 0)
                Row(
                  children: [
                    const TextBodyL(
                      "Cuma bayar",
                      color: TColors.neutralDarkLightest,
                    ),
                    SizedBox(width: 4),
                    TextHeading3(
                      TFormatter.formatToRupiah(package.finalPrice),
                      color: TColors.neutralDarkDarkest,
                    ),
                    SizedBox(width: 4),
                    TextBodyL(
                      TFormatter.formatToRupiah(package.originPrice),
                      color: TColors.neutralDarkLightest,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ],
                ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        // Highlighted Table
        PackageComparisonTable(package: package, quota: quota),
      ],
    );
  }
}

class PackageComparisonTable extends StatelessWidget {
  const PackageComparisonTable(
      {super.key, required this.package, required this.quota});

  // ignore: library_private_types_in_public_api
  final _PackagesDetail package;
  final List<_QuotaPackages> quota;

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
                      TImages.liteLogoLow,
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
                      TImages.growLogoPackage,
                      height: 20,
                      // height: 20,
                    ),
                  ),
                ),
              ],
            ),
            for (int index = 0; index < quota.length; index++)
              TableRow(
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? TColors.neutralLightLightest
                      : TColors.neutralLightLight,
                ),
                children: [
                  TableCell(
                    verticalAlignment:
                        TableCellVerticalAlignment.intrinsicHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: TextHeading4(
                        quota[index].item,
                        color: TColors.neutralDarkDark,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment:
                        TableCellVerticalAlignment.intrinsicHeight,
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
                          bottom: index == quota.length - 1
                              ? BorderSide(
                                  color: TColors.neutralLightMedium,
                                  width: 1.0,
                                )
                              : BorderSide.none,
                        ),
                        borderRadius: index == quota.length - 1
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    12.0), // Radius sudut kiri atas
                                bottomRight: Radius.circular(
                                    12.0), // Radius sudut kanan atas
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
                          quota[index].liteQuota,
                          color: TColors.neutralDarkLight,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment:
                        TableCellVerticalAlignment.intrinsicHeight,
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
                          bottom: index == quota.length - 1
                              ? BorderSide(
                                  color: TColors.highlightDarkest,
                                  width: 2.0,
                                )
                              : BorderSide.none,
                        ),
                        borderRadius: index == quota.length - 1
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    12.0), // Radius sudut kiri atas
                                bottomRight: Radius.circular(
                                    12.0), // Radius sudut kanan atas
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
                          quota[index].upgradeQuota,
                          color: TColors.neutralDarkDark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                'logo': TImages.growLogoPackage,
                'colorWave': Color(0xFF00712D),
                'bgColor': TColors.successLight,
                'packageName': 'Grow',
                'period': package.period,
                'pricePerMonth': package.pricePerMonth,
                'finalPrice': package.finalPrice,
              },
            ),
            child: const TextActionL(
              "Langganan Sekarang",
            ),
          ),
        ),
      ],
    );
  }
}

class _QuotaPackages {
  final String item;
  final String liteQuota;
  final String upgradeQuota;
  final String? frequency;

  _QuotaPackages({
    required this.item,
    required this.liteQuota,
    required this.upgradeQuota,
    this.frequency,
  });
}

class _PackagesDetail {
  final String period;
  final int pricePerMonth;
  final int? discount;
  final int finalPrice;
  final int originPrice;

  _PackagesDetail({
    required this.period,
    required this.pricePerMonth,
    this.discount,
    required this.finalPrice,
    required this.originPrice,
  });
}
