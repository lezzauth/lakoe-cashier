import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';
import 'package:point_of_sales_cashier/features/authentication/data/completing_data/arguments.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class MainMenu extends StatelessWidget {
  final String? cashierName;
  final Function()? onTap;

  const MainMenu({
    super.key,
    this.cashierName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCashierOpened = cashierName != null;

    onCashierOpened() {
      if (!isCashierOpened) {
        return showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: TDeviceUtils.getViewInsets(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextHeading2("Masukan saldo awal"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: const TextField(
                            decoration: InputDecoration(hintText: "Rp 0"),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 28.0),
                          child: const TextBodyS(
                            "Saldo awal adalah jumlah uang tunai yang tersedia di laci kasir sebelum memulai transaksi. Pastikan untuk memasukkan jumlah yang akurat.",
                            color: TColors.neutralDarkLightest,
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/completing-data",
                                  arguments: CompletingDataRouteArguments(
                                    title: "Masukan PIN kamu",
                                    description:
                                        "Jika Anda lupa PIN, hubungi manajer Anda",
                                    onPinValid: (value) {
                                      Navigator.popAndPushNamed(
                                          context, "/explore-products");
                                    },
                                    page: CompletingDataPage.pinInput,
                                  ),
                                );
                              },
                              child: const TextActionL(
                                "Lanjutkan",
                                color: TColors.neutralLightLightest,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    }

    return GestureDetector(
      onTap: onCashierOpened,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            gradient:
                isCashierOpened ? TColors.greenGradient : TColors.redGradient,
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          // height: 90.0,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  TImages.mainMenuWaves,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: const UiIcons(
                            TIcons.cashier,
                          ),
                        ),
                        Text(
                          "Buka Kasir",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeBodyL,
                            fontWeight: FontWeight.w700,
                            color: TColors.neutralLightLightest,
                          ),
                        )
                      ],
                    ),
                    if (isCashierOpened)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              "Kasir: ",
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyM,
                                fontWeight: FontWeight.w400,
                                color: TColors.neutralLightLight,
                              ),
                            ),
                          ),
                          Text(
                            cashierName ?? "",
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyL,
                              fontWeight: FontWeight.w700,
                              color: TColors.neutralLightLightest,
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
