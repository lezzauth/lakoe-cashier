import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class AccountMasterScreen extends StatefulWidget {
  const AccountMasterScreen({super.key});

  @override
  State<AccountMasterScreen> createState() => _AccountMasterScreenState();
}

class _AccountMasterScreenState extends State<AccountMasterScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: TColors.neutralLightLight,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: TColors.neutralLightLightest,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(
        isLightMode: true,
        title: "Profil & Akun",
      ),
      body: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset(
              TImages.liteLevel,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 120),
                  ProfileCard(),
                  SizedBox(height: 20),
                  BalanceCard(),
                  SizedBox(height: 20),
                  OutletCard(),
                  SizedBox(height: 20),
                  OtherCard(),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -36,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: TColors.highlightLightest,
              ),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
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
          Container(
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
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(TImages.defaultAvatar),
                    radius: 46 / 2,
                    backgroundColor: TColors.neutralLightLight,
                  ),
                ),
                const SizedBox(width: 16.0),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeading3(
                        "Tauhid",
                        color: TColors.neutralDarkDark,
                      ),
                      SizedBox(height: 4.0),
                      TextBodyS(
                        "62812-3456-7890",
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
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OutletCard extends StatelessWidget {
  const OutletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OtherCard extends StatelessWidget {
  const OtherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
