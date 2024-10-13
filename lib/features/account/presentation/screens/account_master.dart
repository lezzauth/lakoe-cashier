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
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:random_avatar/random_avatar.dart';

class AccountMasterScreen extends StatefulWidget {
  const AccountMasterScreen({super.key});

  @override
  State<AccountMasterScreen> createState() => _AccountMasterScreenState();
}

class _AccountMasterScreenState extends State<AccountMasterScreen> {
  List<_OtherItem> otherSettingItems = [
    _OtherItem(
      title: "Paket & Riwayat",
      routeName: "/",
      iconSrc: TIcons.billAlt,
    ),
    _OtherItem(
      title: "Kasih Rating",
      routeName: "/",
      iconSrc: TIcons.star,
      textTrailing: "Versi 3.20.0",
    ),
    _OtherItem(
      title: "Syarat & Ketentuan",
      routeName: "/",
      iconSrc: TIcons.document,
    ),
    _OtherItem(
      title: "Kebijakan Privasi",
      routeName: "/",
      iconSrc: TIcons.shieldKeyhole,
    ),
    _OtherItem(
      title: "Atur Akun",
      routeName: "/manage_account",
      iconSrc: TIcons.linkSquare,
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
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                TImages.liteLevelHero,
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
                  const OutletCard(),
                  const SizedBox(height: 12),
                  OtherCard(
                    children: otherSettingItems
                        .map(
                          (item) => ListItemCard(
                            iconSrc: item.iconSrc,
                            title: item.title,
                            routeName: item.routeName,
                            isNewItem: item.isNewItem,
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
          final AppDataProvider _appDataProvider = AppDataProvider();

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
                            future: _appDataProvider
                                .avatarSvg, // Retrieve avatar from SharedPreferences
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Show a loading spinner while fetching avatar
                              }
                              if (snapshot.hasData &&
                                  snapshot.data != null &&
                                  snapshot.data!.isNotEmpty) {
                                return SvgPicture.string(
                                  snapshot
                                      .data!, // Display the stored avatar SVG
                                  height: 46,
                                  width: 46,
                                );
                              } else {
                                return RandomAvatar(
                                  // Fallback to generating a new avatar if none is stored
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: TColors.highlightLightest,
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
                          TImages.liteLogoPackage,
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
        return const CircularProgressIndicator(); // Handle loading state
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

// class OutletCard extends StatelessWidget {
//   const OutletCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       clipBehavior: Clip.antiAlias,
//       decoration: ShapeDecoration(
//         color: TColors.neutralLightLightest,
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(
//             width: 1,
//             color: TColors.neutralLightMedium,
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: TColors.neutralLightMedium,
//                 width: 1.0,
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 44 / 2,
//               backgroundColor: TColors.neutralLightLight,
//               child: Image.asset(
//                 TImages.lakoeLetterPrimary,
//                 height: 24,
//                 width: 24,
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           const Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextHeading3(
//                   "Warmindo Cak Tho",
//                   color: TColors.neutralDarkDark,
//                 ),
//                 SizedBox(height: 2),
//                 TextBodyS(
//                   "Tebet, Jakarta Selatan",
//                   color: TColors.neutralDarkLightest,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class OutletCard extends StatelessWidget {
  const OutletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthReady) {
          String outletName = state.profile.outlets.first.name;
          String outletAddress = state.profile.outlets.first.address;
          String outletLogo = state.profile.outlets.first.logo;

          return Container(
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
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                      width: 1.0,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: TColors.neutralLightLight,
                    child: Image.network(
                      outletLogo,
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
                        outletAddress,
                        color: TColors.neutralDarkLightest,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is AuthLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Unable to load outlet data');
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
  final bool isNewItem;

  _OtherItem({
    required this.title,
    required this.routeName,
    required this.iconSrc,
    this.textTrailing,
    this.isNewItem = false,
  });
}
