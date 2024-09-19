import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              TImages.primaryLogoLakoe,
              height: 20,
              width: 77.1,
            ),
            Wrap(
              spacing: 20.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                UiIcons(
                  onTap: () => Navigator.pushNamed(context, "/notifications"),
                  TIcons.bell,
                  color: TColors.neutralDarkDarkest,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.pushNamed(context, "/account"),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFD3D5DD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 1,
                          top: 1,
                          child: Image.asset(
                            TImages.defaultAvatar,
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 20,
                          child: Image.asset(
                            TImages.liteLogo,
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
