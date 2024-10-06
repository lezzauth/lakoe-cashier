import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_xl.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({
    super.key,
    this.withLogo = false,
    this.title,
    this.description,
    required this.asset,
    this.isTextInputActive = false,
  });

  final bool withLogo;
  final String? title;
  final String? description;
  final String asset;
  final bool isTextInputActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFFFF3EA), Color(0xFFFFD4B3)],
        ),
      ),
      padding: EdgeInsets.only(top: isTextInputActive == true ? 20 : 84),
      child: ResponsiveLayout(
        mobile: isTextInputActive == true
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      TImages.primaryLogoLakoe,
                      height: 40,
                    ),
                    SizedBox(height: 20),
                    TextHeading2(
                      "Aplikasi Kasir Untuk UMKM",
                      color: TColors.neutralDarkDark,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 52),
                    child: Column(
                      children: [
                        if (withLogo)
                          SvgPicture.asset(
                            TImages.primaryLogoLakoe,
                            height: 28,
                          ),
                        if (title != null)
                          TextHeading2(
                            title!,
                            color: TColors.neutralDarkDark,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w900,
                          ),
                        SizedBox(height: !withLogo ? 4 : 12),
                        TextBodyM(
                          description!,
                          color: TColors.neutralDarkDark,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        asset,
                        height: 320,
                      ),
                    ),
                  ),
                ],
              ),
        tablet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (withLogo)
                        SvgPicture.asset(
                          TImages.primaryLogoLakoe,
                          height: 32,
                        ),
                      if (title != null)
                        TextHeading1(
                          title!,
                          color: TColors.neutralDarkDark,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w900,
                        ),
                      SizedBox(height: 16),
                      TextBodyXL(
                        description!,
                        color: TColors.neutralDarkDark,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    asset,
                    height: 320,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
