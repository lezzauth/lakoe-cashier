import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class PackageMasterScreen extends StatefulWidget {
  const PackageMasterScreen({super.key});

  @override
  State<PackageMasterScreen> createState() => _PackageMasterScreenState();
}

class _PackageMasterScreenState extends State<PackageMasterScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;

  List<_CardItemPackage> listCardItemPackage = [
    _CardItemPackage(
      logo: TImages.liteLogoPackage,
      description:
          "Untuk bisnis baru, fitur lengkap dengan batasan penggunaan.",
      price: 0,
      color: Color(0xFFFC4100),
      isActive: true,
    ),
    _CardItemPackage(
      logo: TImages.growLogoPackage,
      description: "Tingkatkan kapasitas bisnis dengan kuota yang lebih besar",
      price: 30000,
      color: Color(0xFF00712D),
      isActive: false,
      routeName: "/packages/grow",
    ),
    _CardItemPackage(
      logo: TImages.proLogoPackage,
      description:
          "Bebaskan potensi bisnis dengan akses tanpa terbatas ke semua fitur Lakoe.",
      price: 56000,
      color: Color(0xFF9306AF),
      isActive: false,
      routeName: "/packages/pro",
    ),
  ];

  List<_CardItemBoost> listCardItemBoost = [
    _CardItemBoost(
      id: 1,
      title: "Boost Transaksi",
      subtitle: "Tambah kuota order dan produk",
      price: 3500,
      routeName: "/boost",
    ),
    _CardItemBoost(
      id: 2,
      title: "Boost Loyalty",
      subtitle: "Raih pelanggan lebih banyak lagi",
      price: 2500,
      routeName: "/boost",
    ),
    _CardItemBoost(
      id: 3,
      title: "Boost Operasional",
      subtitle: "Tambah karyawan dan QR meja",
      price: 4500,
      routeName: "/boost",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      extendBodyBehindAppBar: true,
      appBar: PackageAppbar(),
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                TImages.packageHero,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 112),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeading2("Saatnya Naik Level,\nSaatnya Upgrade Lakoe."),
                SizedBox(height: 8),
                TabContainer(
                  hasPadding: true,
                  controller: _tabController,
                  tabs: [
                    const TabItem(
                      title: "Paket",
                      fontSize: TSizes.fontSizeHeading3,
                    ),
                    TabItem(
                      title: "Boost",
                      labelAssets: _selectedIndex != 1
                          ? SvgPicture.asset(
                              TImages.boostLogoSvg,
                              height: 16,
                              width: 62,
                            )
                          : SvgPicture.asset(
                              TImages.boostLogoSvgLight,
                              height: 16,
                              width: 62,
                            ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      PackageTabView(data: listCardItemPackage),
                      BoostTabView(data: listCardItemBoost),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PackageTabView extends StatelessWidget {
  const PackageTabView({super.key, required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: data
            .map((item) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          TImages.pakcageWaves,
                          colorFilter: ColorFilter.mode(
                            item.color,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.logo,
                              height: 28,
                            ),
                            SizedBox(height: 12),
                            TextBodyM(
                              item.description,
                              color: TColors.neutralDarkLight,
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (item.price != 0)
                                      TextHeading5(
                                        "Mulai dari",
                                        color: TColors.neutralDarkLightest,
                                      ),
                                    TextHeading2(
                                      item.price == 0
                                          ? "Gratis"
                                          : TFormatter.formatToRupiah(
                                              item.price),
                                      color: TColors.neutralDarkDark,
                                    ),
                                  ],
                                ),
                                if (item.isActive == false)
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, item.routeName);
                                    },
                                    style: ButtonStyle(
                                      minimumSize: WidgetStateProperty.all(
                                        Size(0, 36),
                                      ),
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                      ),
                                    ),
                                    child: TextActionL("Cek Detail"),
                                  ),
                                if (item.isActive == true)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: TColors.neutralLightMedium,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const TextHeading5(
                                      "Paket kamu saat ini",
                                      color: TColors.neutralDarkDark,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class BoostTabView extends StatelessWidget {
  const BoostTabView({super.key, required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
          children: data
              .map(
                (item) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeading3(
                            item.title,
                            color: TColors.neutralDarkDarkest,
                          ),
                          TextBodyM(
                            item.subtitle,
                            color: TColors.neutralDarkLightest,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      const Separator(
                        color: TColors.neutralLightMedium,
                        height: 1,
                        dashWidth: 5.0,
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.price != 0)
                                TextBodyS(
                                  "Mulai dari",
                                  color: TColors.neutralDarkLightest,
                                ),
                              TextHeading2(
                                TFormatter.formatToRupiah(item.price),
                                color: TColors.neutralDarkDark,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                item.routeName,
                                arguments: {
                                  'id': item.id,
                                  'title': item.title,
                                  'subtitle': item.subtitle,
                                },
                              );
                            },
                            style: ButtonStyle(
                              minimumSize: WidgetStateProperty.all(
                                Size(0, 36),
                              ),
                              padding: WidgetStateProperty.all(
                                EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                            ),
                            child: TextActionL("Cek Detail"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}

class PackageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PackageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            TImages.primaryLogoLakoe,
            height: 20,
            width: 77.1,
          ),
          UiIcons(
            onTap: () => Navigator.pop(context),
            TIcons.close,
            color: TColors.neutralDarkLightest,
          ),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}

class _CardItemPackage {
  final String logo;
  final String description;
  final bool isActive;
  final int price;
  final Color color;
  final String? routeName;

  _CardItemPackage({
    required this.logo,
    required this.description,
    this.isActive = false,
    required this.price,
    required this.color,
    this.routeName,
  });
}

class _CardItemBoost {
  final int id;
  final String title;
  final String subtitle;
  final int price;
  final String? routeName;

  _CardItemBoost({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    this.routeName,
  });
}
