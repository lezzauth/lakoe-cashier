import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({
    super.key,
    required this.name,
    required this.role,
    this.onTap,
  });

  final String name;
  final String role;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String roleName = "Kasir";

    if (role == "OWNER") {
      roleName = "Pemilik & Kasir";
    } else {
      roleName = "Kasir";
    }

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: SvgPicture.asset(
            TImages.contactAvatar,
            height: 40,
            width: 40,
          ),
          title: TextHeading4(name),
          subtitle: TextBodyS(
            roleName,
            color: TColors.neutralDarkLight,
          ),
          trailing: const UiIcons(
            TIcons.arrowRight,
            size: 16,
            color: TColors.neutralDarkLightest,
          ),
        ),
        const Divider(
          color: TColors.neutralLightMedium,
          indent: 16.0,
          height: 1,
        ),
      ],
    );
  }
}
