import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/shimmer/chimmer_package.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_container.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_item.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_active/package_active_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_active/package_active_state.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/price_info_section.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/appbar/light_appbar.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_state.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';

class PackageUpgradeScreen extends StatefulWidget {
  const PackageUpgradeScreen({super.key});

  @override
  State<PackageUpgradeScreen> createState() => _PackageUpgradeScreenState();
}

class _PackageUpgradeScreenState extends State<PackageUpgradeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  bool isScrolled = false;
  double opacity = 1.0;
  final double scrollThreshold = 100.0;
  String currentPackageName = "GROW";
  String upgradePakcageName = "PRO";
  PackageActive? packageActive;

  TabController? _tabController;
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, initialIndex: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });

    _onInit();
    scrollController.addListener(_handleScroll);
  }

  void _onInit() async {
    await context.read<PackageActiveCubit>().getActivePackage();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null && args.containsKey('currentPackage')) {
        String currentPackageArg = args['currentPackage'] as String;
        String upgradePakcageArg = args['upgradePakcage'] as String;

        setState(() {
          currentPackageName = currentPackageArg;
          upgradePakcageName = upgradePakcageArg;
        });

        context.read<PackageDetailCubit>().findOne(upgradePakcageArg);
      }
    });
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
    super.dispose();
  }

  Future<void> _onRefresh() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null && args.containsKey('currentPackage')) {
        String currentPackageArg = args['currentPackage'] as String;
        String upgradePakcageArg = args['upgradePakcage'] as String;

        setState(() {
          currentPackageName = currentPackageArg;
          upgradePakcageName = upgradePakcageArg;
        });

        context.read<PackageDetailCubit>().findOne(upgradePakcageArg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String heroAsset;
    String? logoAsset;

    if (upgradePakcageName == "GROW") {
      heroAsset = TImages.growLevelHero;
      logoAsset = TImages.lakoeXGrow;
    } else if (upgradePakcageName == "PRO") {
      heroAsset = TImages.proLevelHero;
      logoAsset = TImages.lakoeXPro;
    } else {
      heroAsset = TImages.placeholderHero;
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<PackageActiveCubit, PackageActiveState>(
            listener: (context, state) {
          if (state is GetActivePackageSuccess) {
            setState(() {
              packageActive = state.package;
            });
          }
        }),
      ],
      child: Scaffold(
        backgroundColor: TColors.neutralLightLight,
        extendBodyBehindAppBar: true,
        appBar: !isScrolled
            ? CustomAppbarLight(title: "Upgrade Paket")
            : CustomAppbar(
                title: "Upgrade Paket",
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
            if (state is PackageDetailLoadSuccess) {
              final detail = state.detail;
              return Stack(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (logoAsset != null)
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

                                      PackageModel? currentPackage =
                                          packages.firstWhere((package) =>
                                              package.name ==
                                              currentPackageName);

                                      PackageModel? upgradedPackage =
                                          packages.firstWhere((package) =>
                                              package.name ==
                                              upgradePakcageName);

                                      return PriceInfoSection(
                                        index: _selectedIndex,
                                        packageData: detail,
                                        currentPackage: currentPackage,
                                        upgradedPackage: upgradedPackage,
                                      );
                                    } else {
                                      return Shimmer.fromColors(
                                        baseColor: const Color(0xFFE8E9F1),
                                        highlightColor: const Color(0xFFF8F9FE),
                                        child: Container(
                                          height: 100,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: TColors.neutralLightLightest,
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
              );
            } else if (state is PackageDetailLoadFailure) {
              return EmptyList(
                title: "Gagal memuat data, nih!",
                subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                action: TextButton(
                  onPressed: _onRefresh,
                  child: TextActionL(
                    "Coba Lagi",
                    color: TColors.primary,
                  ),
                ),
              );
            } else {
              return const ShimmerPackage();
            }
          }),
        ),
      ),
    );
  }
}
