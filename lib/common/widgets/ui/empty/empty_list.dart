import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    super.key,
    this.image,
    required this.title,
    required this.subTitle,
  });

  final SvgPicture? image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 92),
          child: Column(
            children: [
              image ??
                  SvgPicture.asset(
                    TImages.searchEmpty,
                    height: 200,
                    width: 276,
                  ),
              Container(
                margin: EdgeInsets.only(top: 28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextHeading2(title),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 311,
                      ),
                      child: TextBodyM(
                        subTitle,
                        color: TColors.neutralDarkLight,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
