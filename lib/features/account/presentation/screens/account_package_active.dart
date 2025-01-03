import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_active/package_active_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_active/package_active_state.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/appbar/light_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/account/presentation/widgets/detail_active_package.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_state.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';

class PackageActiveScreen extends StatefulWidget {
  const PackageActiveScreen({super.key});

  @override
  State<PackageActiveScreen> createState() => _PackageActiveScreenState();
}

class _PackageActiveScreenState extends State<PackageActiveScreen> {
  final ScrollController scrollController = ScrollController();
  bool isScrolled = false;
  double opacity = 1.0;
  final double scrollThreshold = 100.0;
  String packageName = "GROW";
  PackageActive? packageActive;

  @override
  void initState() {
    super.initState();

    _onInit();
    scrollController.addListener(_handleScroll);
  }

  void _onInit() async {
    await context.read<PackageActiveCubit>().getActivePackage();
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

    if (packageName == "GROW") {
      heroAsset = TImages.growLevelHero;
      logoAsset = TImages.lakoeXGrow;
    } else {
      heroAsset = TImages.proLevelHero;
      logoAsset = TImages.lakoeXPro;
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<PackageActiveCubit, PackageActiveState>(
            listener: (context, state) {
          if (state is GetActivePackageSuccess) {
            context.read<PackageDetailCubit>().findOne(state.package.name);
            setState(() {
              packageActive = state.package;
              packageName = state.package.name;
            });
          }
        }),
      ],
      child: Scaffold(
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

                                      PackageModel? litePackage =
                                          packages.firstWhere((package) =>
                                              package.name == 'LITE');

                                      PackageModel? currentPackage =
                                          packages.firstWhere((package) =>
                                              package.name == packageName);

                                      return DetailActivePackage(
                                        index: 0,
                                        packageActive: packageActive,
                                        packageData: detail,
                                        previousPackage: litePackage,
                                        currentPackage: currentPackage,
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
                          SizedBox(height: 20),
                          if (packageName != "PRO")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeading3(
                                  "Butuh level-up bisnis?",
                                  color: TColors.neutralDarkDark,
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    gradient: RadialGradient(
                                      center: Alignment(1, -1),
                                      radius: 2,
                                      colors: [
                                        Color(0xFFFFC55A),
                                        Color(0xFF9305AF)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        TImages.lakoeXPro,
                                        height: 24,
                                      ),
                                      SizedBox(height: 8),
                                      TextBodyM(
                                        "Dengan paket Lakoe Pro kamu bisa berjualan tanpa batas. Semua unlimited.",
                                        color: TColors.neutralLightLightest,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is PackageDetailLoadFailure) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
