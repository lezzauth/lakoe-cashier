import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_master_cubit.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_master_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class PackageMasterScreen extends StatefulWidget {
  const PackageMasterScreen({super.key});

  @override
  State<PackageMasterScreen> createState() => _PackageMasterScreenState();
}

class _PackageMasterScreenState extends State<PackageMasterScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  // int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    context.read<PackageMasterCubit>().init();

    // _tabController = TabController(length: 2, vsync: this);
    // _tabController?.addListener(() {
    //   setState(() {
    //     _selectedIndex = _tabController!.index;
    //   });
    // });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  String _getPackageLogo(String packageName) {
    switch (packageName) {
      case 'LITE':
        return TImages.liteLogoPackage;
      case 'GROW':
        return TImages.growLogoPackage;
      case 'PRO':
        return TImages.proLogoPackage;
      default:
        return TImages.liteLogoPackage;
    }
  }

  Color _getPackageColor(String packageName) {
    switch (packageName) {
      case 'LITE':
        return const Color(0xFFFC4100);
      case 'GROW':
        return const Color(0xFF00712D);
      case 'PRO':
        return const Color(0xFF9306AF);
      default:
        return Colors.grey;
    }
  }

  String _getPackageDesc(String packageName) {
    switch (packageName) {
      case 'LITE':
        return "Untuk bisnis baru, fitur lengkap dengan batasan penggunaan.";
      case 'GROW':
        return "Tingkatkan kapasitas bisnis dengan kuota yang lebih besar";
      case 'PRO':
        return "Bebaskan potensi bisnis dengan akses tanpa terbatas ke semua fitur Lakoe.";
      default:
        return "Deskripsi tidak tersedia";
    }
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              if (authState is AuthReady) {
                final OwnerProfileModel profile = authState.profile;
                return BlocBuilder<PackageMasterCubit, PackageMasterState>(
                  builder: (context, state) {
                    if (state is PackageMasterLoadSuccess) {
                      final List<ModelItemPackage> listCardItemPackage =
                          state.packages.map((package) {
                        return ModelItemPackage(
                          name: package.name,
                          logo: _getPackageLogo(package.name),
                          description: _getPackageDesc(package.name),
                          price: package.price,
                          color: _getPackageColor(package.name),
                          isActive: package.name == profile.packageName,
                        );
                      }).toList();

                      return Container(
                        margin: const EdgeInsets.only(top: 112),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextHeading2(
                                "Saatnya Naik Level,\nSaatnya Upgrade Lakoe."),
                            // SizedBox(height: 8),
                            PackageTabView(data: listCardItemPackage),
                            // TabContainer(
                            //   hasPadding: true,
                            //   controller: _tabController,
                            //   tabs: [
                            //     const TabItem(
                            //       title: "Paket",
                            //       fontSize: TSizes.fontSizeHeading3,
                            //     ),
                            //     TabItem(
                            //       title: "Boost",
                            //       labelAssets: _selectedIndex != 1
                            //           ? SvgPicture.asset(
                            //               TImages.boostLogoSvg,
                            //               height: 16,
                            //               width: 62,
                            //             )
                            //           : SvgPicture.asset(
                            //               TImages.boostLogoSvgWhite,
                            //               height: 16,
                            //               width: 62,
                            //             ),
                            //     ),
                            //   ],
                            // ),
                            // Expanded(
                            //   child: TabBarView(
                            //     controller: _tabController,
                            //     children: [
                            //       PackageTabView(data: listCardItemPackage),
                            //       BoostTabView(data: listCardItemBoost),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    } else if (state is PackageMasterLoadFailure) {
                      return Center(
                        child: TextBodyS(
                          state.error,
                          color: TColors.error,
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
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
    );
  }
}

class PackageTabView extends StatelessWidget {
  const PackageTabView({super.key, required this.data});

  final List<ModelItemPackage> data;

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
                                if (item.isActive == false &&
                                    item.name != "LITE")
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/packages/grow",
                                        arguments: {'packageName': item.name},
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

class ModelItemPackage {
  final String name;
  final String logo;
  final String description;
  final bool isActive;
  final int price;
  final Color color;

  ModelItemPackage({
    required this.name,
    required this.logo,
    required this.description,
    this.isActive = false,
    required this.price,
    required this.color,
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
