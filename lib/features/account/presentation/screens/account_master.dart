import 'dart:async';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:app_data_provider/app_data_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/features/outlets/presentation/widgets/list_outlet_bottomsheet.dart';
import 'package:lakoe_pos/utils/helpers/app_info_helper.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/list_item_card.dart';
import 'package:lakoe_pos/common/widgets/ui/section_card.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/appbar/light_appbar.dart';
import 'package:lakoe_pos/features/account/presentation/widgets/shimmer/account_shimmer.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_cubit.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_state.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_cubit.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountMasterScreen extends StatefulWidget {
  const AccountMasterScreen({super.key});

  @override
  State<AccountMasterScreen> createState() => _AccountMasterScreenState();
}

class _AccountMasterScreenState extends State<AccountMasterScreen> {
  bool isBottomSheetVisible = false;

  late final StreamSubscription<List<ConnectivityResult>>
      connectivitySubscription;

  OutletModel? outlet;

  @override
  void initState() {
    super.initState();

    _onInit();
    _updateAppVersion();
    _getActivePackage();
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  void _onInit() {
    context.read<AuthCubit>().initialize();
    context.read<OwnerCubit>().init();
    context.read<OutletCubit>().init();
    context.read<PackageMasterCubit>().init();

    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        if (!mounted) return;

        if (isBottomSheetVisible) {
          Navigator.pop(context);
          isBottomSheetVisible = false;

          CustomToast.show(
            "Internet terhubung kembali",
            backgroundColor: TColors.success,
          );
        }

        context.read<AuthCubit>().initialize();
        context.read<OwnerCubit>().init();
        context.read<OutletCubit>().init();
        context.read<PackageMasterCubit>().init();
      }
    });
  }

  Future<String> getAppVersion() async {
    String version = await AppInfoHelper.getAppVersion();
    return "Versi $version";
  }

  Future<void> _updateAppVersion() async {
    final appVersion = await getAppVersion();
    setState(() {
      otherSectionItems = otherSectionItems.map((item) {
        if (item.title == "Kasih Rating") {
          return _OtherItem(
            title: item.title,
            routeName: item.routeName,
            iconSrc: item.iconSrc,
            textTrailing: appVersion,
            isNewItem: item.isNewItem,
          );
        }
        return item;
      }).toList();
    });
  }

  Future<void> _getActivePackage() async {
    final ownerCubit = context.read<OwnerCubit>();

    await ownerCubit.getOwner();

    final state = ownerCubit.state;

    if (state is OwnerLoadSuccess) {
      final owner = state.owner;
      String iconPackage = owner.packageName;

      if (owner.packageName == 'GROW') {
        iconPackage = TIcons.lakoeGrow;
      } else if (owner.packageName == 'PRO') {
        iconPackage = TIcons.lakoePro;
      } else {
        iconPackage = TIcons.lakoeLite;
      }

      setState(() {
        accountSectionItems = accountSectionItems.map((item) {
          if (item.title.contains("Paket Aktif")) {
            return _OtherItem(
              title:
                  "Lakoe ${TFormatter.capitalizeEachWord(owner.packageName)}",
              routeName: "",
              iconSrc: iconPackage,
              isNewItem: item.isNewItem,
            );
          }
          return item;
        }).toList();
      });
    } else if (state is OwnerLoadFailure) {}
  }

  List<_OtherItem> accountSectionItems = [
    _OtherItem(
      title: "Profil Bisnis",
      routeName: "",
      iconSrc: TIcons.store,
      isNewItem: true,
    ),
    _OtherItem(
      title: "Paket Aktif",
      routeName: "",
      iconSrc: TIcons.lakoeLite,
      isNewItem: false,
    ),
    _OtherItem(
      title: "Paket & Riwayat",
      routeName: "/packages/purchase/history",
      iconSrc: TIcons.billAlt,
      isNewItem: false,
    ),
  ];

  List<_OtherItem> otherSectionItems = [
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
      title: "Kritik & Saran",
      routeName: "",
      iconSrc: TIcons.documentAdd,
      textTrailing: "",
      isNewItem: false,
    ),
    _OtherItem(
      title: "Kasih Rating",
      routeName: "",
      iconSrc: TIcons.star,
      textTrailing: "",
      isNewItem: false,
    ),
    _OtherItem(
      title: "Atur Akun",
      routeName: "/manage_account",
      iconSrc: TIcons.linkSquare,
      isNewItem: false,
    ),
  ];

  Future<void> openSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  Future<void> _launchPlayStore(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbarLight(
        title: "Profil & Akun",
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) async {
              if (state is ConnectionIssue && !isBottomSheetVisible) {
                isBottomSheetVisible = true;
                if (!mounted) return;

                showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  builder: (context) {
                    return PopScope(
                      canPop: false,
                      onPopInvokedWithResult: (didPop, result) async {},
                      child: CustomBottomsheet(
                        hasGrabber: false,
                        child: ErrorDisplay(
                          imageSrc: TImages.noConnection,
                          title: "Koneksi internet aman ngga?",
                          description:
                              "Coba cek WiFi atau kuota internet kamu dulu terus bisa dicoba lagi, ya!",
                          actionTitlePrimary: "Pengaturan",
                          onActionPrimary: () {
                            isBottomSheetVisible = false;
                            Navigator.pop(context);
                            openSettings();
                          },
                          actionTitleSecondary: "Coba Lagi",
                          onActionSecondary: () async {
                            isBottomSheetVisible = false;
                            Navigator.pop(context);
                            await Future.delayed(Duration(seconds: 2));
                            _onInit();
                          },
                        ),
                      ),
                    );
                  },
                ).whenComplete(() => isBottomSheetVisible = false);
                return;
              }
            },
          ),
        ],
        child: BlocBuilder<OwnerCubit, OwnerState>(
          builder: (context, state) {
            if (state is OwnerLoadSuccess) {
              final profile = state.owner;

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
                          const SizedBox(height: 12),
                          OutletCard(),
                          const SizedBox(height: 12),
                          OtherCard(
                            childrenSectionAccount: accountSectionItems
                                .map(
                                  (item) =>
                                      BlocBuilder<OutletCubit, OutletState>(
                                          builder: (context, state) {
                                    if (state is OutletLoadSuccess) {
                                      return ListItemCard(
                                        iconSrc: item.iconSrc,
                                        title: item.title,
                                        routeName: item.routeName,
                                        isNewItem: item.isNewItem!,
                                        textTrailing: item.textTrailing,
                                        onTap: () {
                                          if (item.title.contains("Lakoe")) {
                                            if (profile.packageName != "LITE") {
                                              Navigator.pushNamed(
                                                context,
                                                "/account/active_package",
                                                arguments: {
                                                  'packageName':
                                                      profile.packageName
                                                },
                                              );
                                            } else {
                                              Navigator.pushNamed(
                                                  context, "/packages");
                                            }
                                          } else if (item.title
                                              .contains("Profil Bisnis")) {
                                            Navigator.pushNamed(
                                              context,
                                              "/outlet/edit",
                                              arguments: state.outlet,
                                            );
                                          }
                                        },
                                      );
                                    } else {
                                      return Shimmer.fromColors(
                                        baseColor: const Color(0xFFE8E9F1),
                                        highlightColor: const Color(0xFFF8F9FE),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: TColors.highlightLightest,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          height: 80,
                                        ),
                                      );
                                    }
                                  }),
                                )
                                .toList(),
                            childrenSectionOther: otherSectionItems
                                .map(
                                  (item) => ListItemCard(
                                    iconSrc: item.iconSrc,
                                    title: item.title,
                                    routeName: item.routeName,
                                    isNewItem: item.isNewItem!,
                                    textTrailing: item.textTrailing,
                                    onTap: () {
                                      if (item.title.contains("Rating")) {
                                        _launchPlayStore(
                                          "https://play.google.com/store/apps/details?id=com.lakoe.app",
                                        );
                                      } else if (item.title.contains("Saran")) {
                                        Navigator.pushNamed(
                                          context,
                                          "/user-feedback",
                                          arguments: profile,
                                        );
                                      }
                                    },
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
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerCubit, OwnerState>(
      builder: (context, state) {
        if (state is OwnerLoadSuccess) {
          final profile = state.owner;
          final AppDataProvider appDataProvider = AppDataProvider();

          return Container(
            decoration: BoxDecoration(
              color: profile.packageName == "GROW"
                  ? TColors.successLight
                  : profile.packageName == "PRO"
                      ? Color(0xFFF4DEF8)
                      : TColors.highlightLightest,
              borderRadius: BorderRadius.circular(12.0),
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
                      borderRadius: BorderRadius.circular(12.0),
                      color: TColors.neutralLightLightest,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
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
                        const SizedBox(width: 12.0),
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
                                PhoneNumberFormatter.formatForDisplay(
                                    profile.phoneNumber),
                                color: TColors.neutralDarkLight,
                              ),
                            ],
                          ),
                        ),
                        const UiIcons(
                          TIcons.settings,
                          size: 24,
                          color: TColors.neutralDarkDark,
                        ),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (profile.packageName != "LITE") {
                      Navigator.pushNamed(
                        context,
                        "/account/active_package",
                        arguments: {'packageName': profile.packageName},
                      );
                    } else {
                      Navigator.pushNamed(context, "/packages");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
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
                          fontWeight: FontWeight.w500,
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
        borderRadius: BorderRadius.circular(12.0),
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
                      size: 16,
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

          // String outletName = state.outlet.name;
          String outletName = "Outlet Utama";
          String? outletAddress = state.outlet.address;
          String? outletLogo = state.outlet.logo;

          return GestureDetector(
            onTap: () {
              ListOutletBottomsheet.show(
                context,
                outlet: state.outlet,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: TColors.neutralLightLightest,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: TColors.neutralLightMedium,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(colorBrand),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          // Colors.transparent,
                          BlendMode.srcATop,
                        ),
                        child: Image.network(
                          outletLogo!,
                          width: 24,
                          height: 24,
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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading4(
                          outletName,
                          color: TColors.neutralDarkDark,
                        ),
                        const SizedBox(height: 2),
                        TextBodyS(
                          outletAddress!,
                          color: TColors.neutralDarkLightest,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: TColors.neutralLightMedium,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: TColors.neutralDarkDark,
                        size: 28,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        ListOutletBottomsheet.show(
                          context,
                          outlet: state.outlet,
                        );
                      },
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
                borderRadius: BorderRadius.circular(12.0),
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
                borderRadius: BorderRadius.circular(12.0),
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
  final List<Widget> childrenSectionAccount;
  final List<Widget> childrenSectionOther;
  const OtherCard({
    super.key,
    required this.childrenSectionAccount,
    required this.childrenSectionOther,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          SectionCard(
            children: childrenSectionAccount,
          ),
          SizedBox(height: 12),
          SectionCard(
            children: childrenSectionOther,
          ),
        ],
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
