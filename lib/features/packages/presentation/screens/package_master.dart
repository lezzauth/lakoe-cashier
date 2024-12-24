import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/packages/common/widgets/shimmer_card_package.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/card_package_item.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

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

  Future<void> _onRefresh() async {
    await context.read<PackageMasterCubit>().init();
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
          RefreshIndicator(
            onRefresh: _onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is AuthReady) {
                  final OwnerProfileModel profile = authState.profile;
                  return SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                      margin: const EdgeInsets.only(top: 112),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextHeading2(
                              "Saatnya Naik Level,\nSaatnya Upgrade Lakoe."),
                          // SizedBox(height: 8),
                          BlocBuilder<PackageMasterCubit, PackageMasterState>(
                              builder: (context, state) {
                            if (state is PackageMasterLoadSuccess) {
                              final List<ModelItemPackage> listCardItemPackage =
                                  state.packages.map((package) {
                                return ModelItemPackage(
                                  name: package.name,
                                  logo: _getPackageLogo(package.name),
                                  description: _getPackageDesc(package.name),
                                  price: package.pricePerMonth ?? 0,
                                  color: _getPackageColor(package.name),
                                  isActive: package.name == profile.packageName,
                                );
                              }).toList();
                              return CardPackageItem(data: listCardItemPackage);
                            } else if (state is PackageMasterLoadFailure) {
                              return Container(
                                margin: EdgeInsets.only(top: 112),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextHeading2(
                                      "Saatnya Naik Level,\nSaatnya Upgrade Lakoe.",
                                    ),
                                    Center(
                                      child: EmptyList(
                                        title: "Gagal memuat data, nih!",
                                        subTitle:
                                            "Ada sedikit gangguan. Coba coba lagi, ya",
                                        action: TextButton(
                                          onPressed: _onRefresh,
                                          child: TextActionL(
                                            "Coba Lagi",
                                            color: TColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return ShimmerCardPackage();
                            }
                          }),
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
                          //       CardPackageItem(data: listCardItemPackage),
                          //       CardBoostItem(data: listCardItemBoost),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
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
