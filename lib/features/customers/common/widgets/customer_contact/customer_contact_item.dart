import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class CustomerContactItem extends StatelessWidget {
  const CustomerContactItem({
    super.key,
    required this.name,
    this.phoneNumber,
    this.onTap,
  });

  final String name;
  final String? phoneNumber;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        TImages.contactAvatar,
        height: 40,
        width: 40,
      ),
      title: TextHeading4(name),
      subtitle: TextBodyS(
        phoneNumber ?? '-',
        color: TColors.neutralDarkLight,
      ),
      trailing: UiIcons(
        TIcons.arrowRight,
        height: 12,
        width: 12,
        color: TColors.neutralDarkLightest,
      ),
    );
  }
}
