import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class PaymentFailedScreen extends StatefulWidget {
  const PaymentFailedScreen({super.key});

  @override
  State<PaymentFailedScreen> createState() => _PaymentFailedScreenState();
}

class _PaymentFailedScreenState extends State<PaymentFailedScreen> {
  Map<String, dynamic>? args;
  Color bgColor = Color(0xFF00712D);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

        if (args != null) {
          if (args!['packageName'] == 'GROW') {
            bgColor = Color(0xFF00712D);
          } else if (args!['packageName'] == 'PRO') {
            bgColor = Color(0xFF9305AF);
          }
          _updateNavigationBarColor();
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateNavigationBarColor();
  }

  void _updateNavigationBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF7E868B),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (popDisposition, popResult) async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/home",
              (route) => false,
            );
          }
        });
        return Future.value(null);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -1),
                  radius: 2,
                  colors: [Color(0xFFFFFFFF), Color(0xFF7E868B)],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 80),
                          Image.asset(
                            TImages.failedUpgraded,
                            height: 200,
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              children: [
                                TextHeading2(
                                  "Yah! Gagal upgrade, nih!",
                                  color: TColors.neutralDarkDark,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                TextBodyM(
                                  "Tenang, jangan panik. Kamu bisa langsung mencobanya sekali lagi",
                                  color: TColors.neutralDarkDark,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/home",
                          (route) => false,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: TColors.neutralLightLightest,
                        side: const BorderSide(
                            color: TColors.neutralLightLightest),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const TextActionL("Kembali ke Halaman Utama"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
