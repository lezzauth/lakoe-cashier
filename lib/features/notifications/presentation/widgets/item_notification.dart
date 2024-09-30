import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ItemNotification extends StatelessWidget {
  final String category;
  final String title;
  final String message;
  final String? bannerImage;
  final String dateTime;
  final bool unread;
  final Color bgColorAvatar;
  final Color? colorIcon;
  final String? icon;
  final String? iconImg;
  final String routeName;

  const ItemNotification({
    super.key,
    required this.category,
    required this.title,
    required this.message,
    this.bannerImage,
    required this.dateTime,
    required this.unread,
    required this.bgColorAvatar,
    this.colorIcon,
    this.icon,
    this.iconImg,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: TColors.highlightLightest,
      highlightColor: TColors.highlightLightest,
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: bgColorAvatar,
                      child: iconImg != null
                          ? Image.asset(
                              iconImg!,
                              height: 24,
                              width: 24,
                            )
                          : UiIcons(
                              icon!,
                              color: colorIcon!,
                            ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              if (unread)
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: TColors.error,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              TextHeading3(
                                title,
                                color: TColors.neutralDarkDark,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          TextBodyM(
                            message,
                            color: TColors.neutralDarkMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          TextBodyS(
                            dateTime,
                            color: TColors.neutralDarkLightest,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (bannerImage != null)
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      Image.asset(
                        bannerImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            indent: 16,
            color: TColors.neutralLightMedium,
          ),
        ],
      ),
    );
  }
}

enum CategoryNotification { transaction, offering, information }
