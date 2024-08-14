import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({super.key});

  @override
  State<OtpInputScreen> createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  final TextEditingController _optController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _optController.addListener(() {
      if (_optController.text.length == 4) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushNamed(context, "/completing-data");
        });
      }
    });
  }

  @override
  void dispose() {
    _optController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
        fontSize: TSizes.fontSizeBodyM,
        color: TColors.neutralDarkDarkest,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: TColors.neutralLightDark),
        borderRadius: BorderRadius.circular(TSizes.inputRadius),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: TColors.primary, width: 1.5),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 23.5),
                margin: const EdgeInsets.only(top: 88.5),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Verifikasi Nomor WhatsApp",
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeHeading3,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            "Masukkan 4 digit kode OTP yang telah kami kirimkan melalui WhatsApp untuk melanjutkan.",
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyS,
                              color: TColors.neutralDarkMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      length: 4,
                      autofocus: true,
                      controller: _optController,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                    width: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "59:00",
                    style: GoogleFonts.inter(
                      color: TColors.primary,
                      fontSize: TSizes.fontSizeActionL,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
