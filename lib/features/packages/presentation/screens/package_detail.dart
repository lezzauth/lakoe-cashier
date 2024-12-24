import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/appbar/light_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_container.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_item.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_state.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_state.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/price_info_section.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({super.key});

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  bool isScrolled = false;
  double opacity = 1.0;
  final double scrollThreshold = 100.0;

  TabController? _tabController;
  int _selectedIndex = 3;

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

    _tabController = TabController(length: 4, initialIndex: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });

    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    setState(() {
      opacity =
          (1 - (scrollController.offset / scrollThreshold)).clamp(0.0, 1.0);

      if (scrollController.offset > 50 && !isScrolled) {
        isScrolled = true;
        _setSystemUIOverlayStyle(dark: true);
      } else if (scrollController.offset <= 50 && isScrolled) {
        isScrolled = false;
        _setSystemUIOverlayStyle(dark: false);
      }
    });
  }

  Future<void> _onRefresh() async {
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
  }

  void _setSystemUIOverlayStyle({required bool dark}) {
    SystemChrome.setSystemUIOverlayStyle(
      dark
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: TColors.neutralLightLight,
              systemNavigationBarColor: TColors.neutralLightLight,
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: TColors.neutralLightLight,
            ),
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(_handleScroll);
    scrollController.dispose();
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
      appBar: !isScrolled
          ? CustomAppbarLight(title: "Detail Paket")
          : CustomAppbar(
              title: "Detail Paket",
              backgroundColor: TColors.neutralLightLight,
            ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _handleScroll();
          }
          return false;
        },
        child: BlocBuilder<PackageDetailCubit, PackageDetailState>(
          builder: (context, state) {
            return switch (state) {
              PackageDetailLoadSuccess(:final detail) => Stack(
                  children: [
                    if (!isScrolled)
                      Positioned(
                        child: Opacity(
                          opacity: opacity,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 246,
                            child: SvgPicture.asset(
                              heroAsset,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    SingleChildScrollView(
                      controller: scrollController,
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

                                        return PriceInfoSection(
                                          index: _selectedIndex,
                                          packageData: detail,
                                          litePackage: litePackage,
                                          upgradedPackage: upgradedPackage,
                                        );
                                      } else {
                                        return Shimmer.fromColors(
                                          baseColor: const Color(0xFFE8E9F1),
                                          highlightColor:
                                              const Color(0xFFF8F9FE),
                                          child: Container(
                                            height: 100,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color:
                                                  TColors.neutralLightLightest,
                                            ),
                                          ),
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
              PackageDetailLoadFailure() => EmptyList(
                  title: "Gagal memuat data, nih!",
                  subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                  action: TextButton(
                    onPressed: _onRefresh,
                    child: TextActionL(
                      "Coba Lagi",
                      color: TColors.primary,
                    ),
                  ),
                ),
              _ => Center(
                  child: CircularProgressIndicator(),
                ),
            };
          },
        ),
      ),
    );
  }
}
