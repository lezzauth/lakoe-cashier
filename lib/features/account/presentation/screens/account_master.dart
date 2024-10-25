import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/list_item_card.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/section_card.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/light_appbar.dart';
import 'package:point_of_sales_cashier/features/account/presentation/widgets/shimmer/account_shimmer.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/outlets/application/outlet_cubit.dart';
import 'package:point_of_sales_cashier/features/outlets/application/outlet_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

class AccountMasterScreen extends StatefulWidget {
  const AccountMasterScreen({super.key});

  @override
  State<AccountMasterScreen> createState() => _AccountMasterScreenState();
}

class _AccountMasterScreenState extends State<AccountMasterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().initialize();
    _onInit();
  }

  void _onInit() {
    context.read<OutletCubit>().init();
  }

  List<_OtherItem> otherSettingItems = [
    _OtherItem(
      title: "Paket & Riwayat",
      routeName: "/",
      iconSrc: TIcons.billAlt,
      isNewItem: false,
    ),
    _OtherItem(
      title: "Kasih Rating",
      routeName: "/",
      iconSrc: TIcons.star,
      textTrailing: "Versi 3.20.0",
      isNewItem: false,
    ),
    _OtherItem(
      title: "Syarat & Ketentuan",
      routeName: "/terms_conditions",
      iconSrc: TIcons.document,
      isNewItem: false,
    ),
    _OtherItem(
      title: "Kebijakan Privasi",
      routeName: "/privacy_policy",
      iconSrc: TIcons.shieldKeyhole,
      isNewItem: false,
    ),
    _OtherItem(
      title: "Atur Akun",
      routeName: "/manage_account",
      iconSrc: TIcons.linkSquare,
      isNewItem: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbarLight(
        title: "Profil & Akun",
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthReady) {
            final profile = state.profile;

            return Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      profile.packageName == "GROW"
                          ? TImages.growLevelHero
                          : profile.packageName == "PRO"
                              ? TImages.proLevelHero
                              : TImages.liteLevelHero,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        ProfileCard(),
                        // const SizedBox(height: 12),
                        // const BalanceCard(),
                        const SizedBox(height: 12),
                        OutletCard(),
                        const SizedBox(height: 12),
                        OtherCard(
                          children: otherSettingItems
                              .map(
                                (item) => ListItemCard(
                                  iconSrc: item.iconSrc,
                                  title: item.title,
                                  routeName: item.routeName,
                                  isNewItem: item.isNewItem!,
                                  textTrailing: item.textTrailing,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    TImages.placeholderHero,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AccountShimmer(),
            ],
          );
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthReady) {
          final profile = state.profile;
          final AppDataProvider appDataProvider = AppDataProvider();

          return Container(
            decoration: BoxDecoration(
              color: TColors.highlightLightest,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.pushNamed(context, "/account/edit"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: TColors.neutralLightLightest,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: TColors.neutralLightDark,
                              width: 1.0,
                            ),
                          ),
                          child: FutureBuilder<String?>(
                            future: appDataProvider.avatarSvg,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.0,
                                  ),
                                );
                              }
                              if (snapshot.hasData &&
                                  snapshot.data != null &&
                                  snapshot.data!.isNotEmpty) {
                                return SvgPicture.string(
                                  snapshot.data!,
                                  height: 46,
                                  width: 46,
                                );
                              } else {
                                return RandomAvatar(
                                  profile.id,
                                  height: 46,
                                  width: 46,
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading3(
                                profile.name,
                                color: TColors.neutralDarkDark,
                              ),
                              const SizedBox(height: 2.0),
                              TextBodyS(
                                profile.phoneNumber.replaceFirst('+', ''),
                                color: TColors.neutralDarkLight,
                              ),
                            ],
                          ),
                        ),
                        const UiIcons(
                          TIcons.arrowRight,
                          height: 20,
                          width: 20,
                          color: TColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.pushNamed(context, "/packages"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: profile.packageName == "GROW"
                          ? TColors.successLight
                          : profile.packageName == "PRO"
                              ? Color(0xFFF4DEF8)
                              : TColors.highlightLightest,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextBodyM(
                          "Paket aktif kamu saat ini",
                          color: TColors.neutralDarkDarkest,
                        ),
                        const SizedBox(width: 8.0),
                        Image.asset(
                          profile.packageName == "GROW"
                              ? TImages.growLogoPackage
                              : profile.packageName == "PRO"
                                  ? TImages.proLogoPackage
                                  : TImages.liteLogoPackage,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFFFF606C), Color(0xFFFD6D00)],
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              TImages.balanceWaves,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UiIcons(
                      TIcons.wallet,
                      height: 16,
                      width: 16,
                      color: TColors.neutralLightLight,
                    ),
                    SizedBox(width: 6),
                    TextHeading4(
                      "Saldo",
                      color: TColors.neutralLightLight,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                TextHeading1(
                  "Rp580.000",
                  color: TColors.neutralLightLightest,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OutletCard extends StatelessWidget {
  const OutletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutletCubit, OutletState>(
      builder: (context, state) {
        if (state is OutletLoadSuccess) {
          int? colorBrand;

          if (state.outlet.color != null) {
            colorBrand = int.parse(state.outlet.color!.replaceFirst("0x", ""),
                radix: 16);
          } else {
            colorBrand = 0xFFFD6E00;
          }

          String outletName = state.outlet.name;
          String? outletAddress = state.outlet.address;
          String? outletLogo = state.outlet.logo;

          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => Navigator.pushNamed(
              context,
              "/outlet/edit",
              arguments: state.outlet,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: TColors.neutralLightLightest,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: TColors.neutralLightMedium,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //   color: TColors.neutralLightMedium,
                      //   width: 1.0,
                      // ),
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(colorBrand),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          // Colors.white,
                          Colors.transparent,
                          BlendMode.srcATop,
                        ),
                        child: Image.network(
                          outletLogo!,
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              TImages.lakoeLetterPrimary,
                              width: 24,
                              height: 24,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading3(
                          outletName,
                          color: TColors.neutralDarkDark,
                        ),
                        const SizedBox(height: 2),
                        TextBodyS(
                          outletAddress!,
                          color: TColors.neutralDarkLightest,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is OutletLoadInProgress) {
          return Shimmer.fromColors(
            baseColor: const Color(0xFFE8E9F1),
            highlightColor: const Color(0xFFF8F9FE),
            child: Container(
              decoration: BoxDecoration(
                color: TColors.highlightLightest,
                borderRadius: BorderRadius.circular(16.0),
              ),
              height: 80,
            ),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: const Color(0xFFE8E9F1),
            highlightColor: const Color(0xFFF8F9FE),
            child: Container(
              decoration: BoxDecoration(
                color: TColors.highlightLightest,
                borderRadius: BorderRadius.circular(16.0),
              ),
              height: 80,
            ),
          );
        }
      },
    );
  }
}

class OtherCard extends StatelessWidget {
  final List<Widget> children;
  const OtherCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: SectionCard(
        title: "Lainnya",
        children: children,
      ),
    );
  }
}

class _OtherItem {
  final String title;
  final String routeName;
  final String iconSrc;
  final String? textTrailing;
  final bool? isNewItem;

  _OtherItem({
    required this.title,
    required this.routeName,
    required this.iconSrc,
    this.textTrailing,
    this.isNewItem,
  });
}
