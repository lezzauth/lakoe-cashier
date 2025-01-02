import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    super.key,
    this.image,
    required this.title,
    required this.subTitle,
    this.action,
    this.withTopSpace = true,
  });

  final SvgPicture? image;
  final String title;
  final String subTitle;
  final Widget? action;
  final bool withTopSpace;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: withTopSpace ? 92 : 0),
          child: Column(
            children: [
              image ?? SvgPicture.asset(TImages.searchEmpty, height: 160),
              Container(
                margin: const EdgeInsets.only(top: 28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextHeading2(
                      title,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 311,
                      ),
                      child: TextBodyM(
                        subTitle,
                        color: TColors.neutralDarkLight,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (action != null) action!,
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
