import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_repository/package_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/light_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_detail/package_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_detail/package_detail_state.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_master_cubit.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_master_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({super.key});

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;

  String packageName = "GROW";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null && args.containsKey('packageName')) {
        String packageNameArg = args['packageName'] as String;

        setState(() {
          packageName = packageNameArg;
        });

        context
            .read<PackageDetailCubit>()
            .findOne(packageNameArg.toUpperCase());
      }
    });

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
    String heroAsset;
    String logoAsset;

    if (packageName == "GROW") {
      heroAsset = TImages.growLevelHero;
      logoAsset = TImages.lakoeXGrow;
    } else {
      heroAsset = TImages.proLevelHero;
      logoAsset = TImages.lakoeXPro;
    }

    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbarLight(
        title: "Detail Paket",
      ),
      body: BlocBuilder<PackageDetailCubit, PackageDetailState>(
        builder: (context, state) {
          return switch (state) {
            PackageDetailLoadSuccess(:final detail) => Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 246,
                      child: SvgPicture.asset(
                        heroAsset,
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
                              logoAsset,
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
                                  tabs: detail.map((package) {
                                    // Convert period 12 to "1 Tahun", otherwise keep period as is
                                    final title = package.period == 12
                                        ? "1 Tahun"
                                        : "${package.period} Bulan";
                                    return TabItem(title: title);
                                  }).toList(),
                                ),
                                BlocBuilder<PackageMasterCubit,
                                    PackageMasterState>(
                                  builder: (context, state) {
                                    if (state is PackageMasterLoadSuccess) {
                                      final packages = state.packages;

                                      PackageModel? litePackage =
                                          packages.firstWhere((package) =>
                                              package.name == 'LITE');

                                      PackageModel? upgradedPackage =
                                          packages.firstWhere((package) =>
                                              package.name == packageName);

                                      return TabViewPackage(
                                        index: _selectedIndex,
                                        packageData: detail,
                                        litePackage: litePackage,
                                        upgradedPackage: upgradedPackage,
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
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
            PackageDetailLoadFailure(:final error) => Center(
                child: TextBodyS(
                  error,
                  color: TColors.error,
                ),
              ),
            _ => const Center(child: CircularProgressIndicator()),
          };
        },
      ),
    );
  }
}

class TabViewPackage extends StatelessWidget {
  const TabViewPackage({
    super.key,
    required this.index,
    required this.packageData,
    required this.litePackage,
    required this.upgradedPackage,
  });

  final int index;
  final List<PackagePriceModel> packageData;
  final PackageModel litePackage;
  final PackageModel upgradedPackage;

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
                      TFormatter.formatToRupiah(package.price),
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
        PackageComparisonTable(
          package: package,
          litePackage: litePackage,
          upgradedPackage: upgradedPackage,
        ),
      ],
    );
  }
}

class PackageComparisonTable extends StatelessWidget {
  const PackageComparisonTable({
    super.key,
    required this.package,
    required this.litePackage,
    required this.upgradedPackage,
  });

  final PackagePriceModel package;
  final PackageModel litePackage;
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
                      package.name == "GROW"
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
              litePackage.orders,
              upgradedPackage.orders,
            ),
            _buildTableRow(
              context,
              1,
              "Data menu/produk",
              litePackage.products,
              upgradedPackage.products,
            ),
            _buildTableRow(
              context,
              2,
              "Data Karyawan",
              litePackage.employees,
              upgradedPackage.employees,
            ),
            _buildTableRow(
              context,
              3,
              "Data Pelanggan",
              litePackage.customers,
              upgradedPackage.customers,
            ),
            _buildTableRow(
              context,
              4,
              "QR Meja",
              litePackage.tables,
              upgradedPackage.tables,
              isLast: true,
            ),
            // _buildTableRow(
            //   context,
            //   5,
            //   "Integrasi Perangkat",
            //   litePackage.hardwareIntergation,
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
                'logo': package.name == "GROW"
                    ? TImages.growLogoPackage
                    : TImages.proLogoPackage,
                'colorWave': package.name == "GROW"
                    ? Color(0xFF00712D)
                    : Color(0xFF9306AF),
                'bgColor': package.name == "GROW"
                    ? TColors.successLight
                    : Color(0xFFF4DEF8),
                'packageName': package.name,
                'period': package.period,
                'pricePerMonth': package.pricePerMonth,
                'finalPrice': package.price,
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
                    isLast == true ? TIcons.info : TIcons.infinity,
                    height: 20,
                    width: 20,
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
                                    height: 48,
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: TextActionL("Oke. Mengerti"),
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
