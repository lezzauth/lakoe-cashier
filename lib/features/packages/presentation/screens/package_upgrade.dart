import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/table_comparison.dart';
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

class _PackageUpgradeScreenState extends State<PackageUpgradeScreen> {
  final ScrollController scrollController = ScrollController();
  bool isScrolled = false;
  double opacity = 1.0;
  final double scrollThreshold = 100.0;
  String currentPackageName = "GROW";
  String upgradePakcageName = "PRO";

  @override
  void initState() {
    super.initState();

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

        context.read<PackageDetailCubit>().findOne(currentPackageArg);
      }
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

  @override
  Widget build(BuildContext context) {
    String heroAsset;
    String logoAsset;

    if (currentPackageName == "GROW") {
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
          ? CustomAppbarLight(title: "Paket Aktif")
          : CustomAppbar(
              title: "Paket Aktif",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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

                                      return DetailPackage(
                                        index: 0,
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
              ),
            PackageDetailLoadFailure() => Center(
                child: CircularProgressIndicator(),
              ),
            _ => Center(
                child: CircularProgressIndicator(),
              ),
          };
        }),
      ),
    );
  }
}

class DetailPackage extends StatelessWidget {
  const DetailPackage({
    super.key,
    required this.index,
    required this.packageData,
    required this.currentPackage,
    required this.upgradedPackage,
  });

  final int index;
  final List<PackagePriceModel> packageData;
  final PackageModel currentPackage;
  final PackageModel upgradedPackage;

  @override
  Widget build(BuildContext context) {
    final package = packageData[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBodyM(
                "Paket aktif hingga",
                color: TColors.neutralDarkLight,
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  TextHeading3(
                    "08 Feb 2025",
                    color: TColors.neutralDarkDark,
                  ),
                  TextBodyM(
                    " • 3 bulan 21 hari",
                    color: TColors.neutralDarkLight,
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
          currentPackage: currentPackage,
          upgradedPackage: upgradedPackage,
        ),
      ],
    );
  }
}
