import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CustomerContactItem extends StatelessWidget {
  const CustomerContactItem({
    super.key,
    required this.customer,
    this.onTap,
    this.withDivider = true,
  });

  final CustomerModel customer;
  final Function()? onTap;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    bool isGuest = customer.id == "-";

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: SvgPicture.asset(
            TImages.contactAvatar,
            height: 40,
            width: 40,
          ),
          title: TextHeading4(customer.name),
          subtitle: TextBodyS(
            customer.phoneNumber.isEmpty ||
                    customer.phoneNumber == '-' ||
                    isGuest
                ? '-'
                : PhoneNumberFormatter.formatForDisplay(customer.phoneNumber),
            color: TColors.neutralDarkLight,
          ),
          trailing: isGuest
              ? null
              : const UiIcons(
                  TIcons.arrowRight,
                  size: 16,
                  color: TColors.neutralDarkLightest,
                ),
        ),
        if (withDivider)
          Divider(
            color: TColors.neutralLightMedium,
            indent: 16.0,
            height: 1,
          ),
      ],
    );
  }
}
