import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CustomerContactCard extends StatelessWidget {
  const CustomerContactCard({
    super.key,
    required this.customer,
    this.onTap,
  });

  final CustomerModel customer;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isGuest = customer.id == "-";

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: TColors.neutralLightLightest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: TColors.neutralLightMedium),
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: TColors.highlightLightest,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              width: 60,
              child: Center(
                child: SvgPicture.asset(
                  TImages.contactAvatar,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextHeading4(
                            customer.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: TextBodyS(
                        customer.phoneNumber.isEmpty || isGuest
                            ? '-'
                            : PhoneNumberFormatter.formatForDisplay(
                                customer.phoneNumber),
                        color: TColors.neutralDarkLightest,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
