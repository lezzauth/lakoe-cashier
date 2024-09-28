import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/light_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/counter.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class BoostDetailScreen extends StatefulWidget {
  const BoostDetailScreen({super.key});

  @override
  State<BoostDetailScreen> createState() => _BoostDetailScreenState();
}

class _BoostDetailScreenState extends State<BoostDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;

  List<_BoostDetail> listPeriodBoostTransaction = [
    _BoostDetail(
      period: "1",
      pricePerMonth: 9500,
      discount: 0,
      finalPrice: 9500,
      originPrice: 9500,
    ),
    _BoostDetail(
      period: "3",
      pricePerMonth: 8550,
      discount: 10,
      finalPrice: 25650,
      originPrice: 28500,
    ),
    _BoostDetail(
      period: "6",
      pricePerMonth: 7600,
      discount: 20,
      finalPrice: 45600,
      originPrice: 57000,
    ),
    _BoostDetail(
      period: "12",
      pricePerMonth: 5700,
      discount: 40,
      finalPrice: 68400,
      originPrice: 114000,
    ),
  ];
  List<_BoostDetail> listPeriodBoostLoyalty = [
    _BoostDetail(
      period: "1",
      pricePerMonth: 6000,
      discount: 0,
      finalPrice: 6000,
      originPrice: 6000,
    ),
    _BoostDetail(
      period: "3",
      pricePerMonth: 5400,
      discount: 10,
      finalPrice: 16200,
      originPrice: 18000,
    ),
    _BoostDetail(
      period: "6",
      pricePerMonth: 4800,
      discount: 20,
      finalPrice: 28800,
      originPrice: 36000,
    ),
    _BoostDetail(
      period: "12",
      pricePerMonth: 3600,
      discount: 40,
      finalPrice: 43200,
      originPrice: 72000,
    ),
  ];

  List<_BoostDetail> listPeriodBoostOperation = [
    _BoostDetail(
      period: "1",
      pricePerMonth: 6500,
      discount: 0,
      finalPrice: 6500,
      originPrice: 6500,
    ),
    _BoostDetail(
      period: "3",
      pricePerMonth: 5850,
      discount: 10,
      finalPrice: 17550,
      originPrice: 19500,
    ),
    _BoostDetail(
      period: "6",
      pricePerMonth: 5200,
      discount: 20,
      finalPrice: 31200,
      originPrice: 39000,
    ),
    _BoostDetail(
      period: "12",
      pricePerMonth: 3900,
      discount: 40,
      finalPrice: 46800,
      originPrice: 78000,
    ),
  ];

  List<_ModuleItemPackage> listItemModuleTransaction = [
    _ModuleItemPackage(
      name: "Pesanan",
      description: "Min. 50 kuota",
      minQty: 50,
      qty: 50,
    ),
    _ModuleItemPackage(
      name: "Produk",
      description: "Min. 25 kuota",
      minQty: 25,
      qty: 25,
    ),
  ];
  List<_ModuleItemPackage> listItemModuleLoyalty = [
    _ModuleItemPackage(
      name: "Data Pelanggan",
      description: "Min. 50 data",
      minQty: 50,
      qty: 50,
    ),
    _ModuleItemPackage(
      isQuotaType: false,
      name: "Reward Program",
      description: "Buat pelanggan lebih loyal",
      isActive: true,
    ),
  ];
  List<_ModuleItemPackage> listItemModuleOperation = [
    _ModuleItemPackage(
      name: "Data Karyawan",
      description: "Min. 5 data",
      minQty: 5,
      qty: 5,
    ),
    _ModuleItemPackage(
      name: "QR Meja",
      description: "Min. 10 kuota",
      minQty: 10,
      qty: 10,
    ),
    _ModuleItemPackage(
      name: "Integrasi Device",
      description: "Min. 1 device",
      minQty: 1,
      qty: 1,
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
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    int id = arguments['id'];
    String title = arguments['title'];
    String subtitle = arguments['subtitle'];

    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbarLight(
        title: title,
      ),
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 246,
              child: SvgPicture.asset(
                TImages.boostHero,
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
                      TImages.boostLightLogo,
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
                          index: _selectedIndex,
                          title: title,
                          subtitle: subtitle,
                          packageInfo: id == 1
                              ? listPeriodBoostTransaction
                              : id == 2
                                  ? listPeriodBoostLoyalty
                                  : listPeriodBoostOperation,
                          itemPackage: id == 1
                              ? listItemModuleTransaction
                              : id == 2
                                  ? listItemModuleLoyalty
                                  : listItemModuleOperation,
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
    required this.index,
    required this.packageInfo,
    required this.itemPackage,
    required this.title,
    required this.subtitle,
  });

  // ignore: library_private_types_in_public_api
  final int index;
  // ignore: library_private_types_in_public_api
  final List<_BoostDetail> packageInfo;
  // ignore: library_private_types_in_public_api
  final List<_ModuleItemPackage> itemPackage;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final package = packageInfo[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (package.discount != 0)
                Container(
                  margin: EdgeInsets.only(bottom: 4),
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
              TextHeading2(
                title,
                color: TColors.neutralDarkDarkest,
              ),
              const SizedBox(width: 4),
              TextBodyM(
                subtitle,
                color: TColors.neutralDarkLightest,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: itemPackage
              .map(
                (item) => Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColors.neutralLightMedium,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading4(
                              item.name,
                              color: TColors.neutralDarkDark,
                            ),
                            TextBodyS(
                              item.description,
                              color: TColors.neutralDarkLightest,
                            ),
                          ],
                        ),
                        if (item.isQuotaType)
                          Counter(
                            isDeletable: false,
                            value: item.qty!,
                            minValue: item.minQty!,
                            onChanged: (qty) {},
                          ),
                        if (!item.isQuotaType)
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Switch(
                              value: item.isActive!,
                              onChanged: (value) {},
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBodyM(
                    "Harga",
                    color: TColors.neutralDarkDark,
                  ),
                  TextHeading4(
                    TFormatter.formatToRupiah(package.originPrice),
                    color: TColors.neutralDarkDark,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBodyM(
                    "Diskon",
                    color: TColors.neutralDarkDark,
                  ),
                  TextHeading4(
                    "${package.discount}%",
                    color: TColors.neutralDarkDark,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBodyM(
                    "Total tagihan",
                    color: TColors.neutralDarkDark,
                  ),
                  TextHeading4(
                    TFormatter.formatToRupiah(package.finalPrice),
                    color: TColors.neutralDarkDark,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
              SizedBox(height: 8),
              const Separator(
                color: TColors.neutralLightMedium,
                height: 1,
                dashWidth: 5.0,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBodyM(
                    "Masa aktif",
                    color: TColors.neutralDarkDark,
                  ),
                  TextHeading4(
                    package.period == "12"
                        ? "1 Tahun"
                        : "${package.period} Bulan",
                    color: TColors.neutralDarkDark,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            // ignore: avoid_print
            onPressed: () => print("Saved!"),
            child: const TextActionL(
              "Langganan Sekarang",
            ),
          ),
        ),
      ],
    );
  }
}

class _BoostDetail {
  final String period;
  final int pricePerMonth;
  final int? discount;
  final int finalPrice;
  final int originPrice;

  _BoostDetail({
    required this.period,
    required this.pricePerMonth,
    this.discount,
    required this.finalPrice,
    required this.originPrice,
  });
}

class _ModuleItemPackage {
  final bool isQuotaType;
  final String name;
  final String description;
  final int? minQty;
  final int? qty;
  final bool? isActive;

  _ModuleItemPackage({
    this.isQuotaType = true,
    required this.name,
    required this.description,
    this.minQty,
    this.qty,
    this.isActive,
  });
}
