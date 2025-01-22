import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableItem extends StatelessWidget {
  const TableItem({super.key, required this.table, this.onTap});

  final TableModel table;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String title = table.no;
    String subtitle = "${table.capacity} Orang • ${table.outletRoom!.name}";

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          splashColor: TColors.highlightLightest,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: TColors.highlightLightest,
            ),
            child: const Center(
              child: UiIcons(
                TIcons.tableRestaurant,
                color: TColors.primary,
                size: 20,
              ),
            ),
          ),
          title: TextHeading4(
            title,
            color: TColors.neutralDarkDarkest,
          ),
          subtitle: TextBodyS(
            subtitle,
            color: TColors.neutralDarkLight,
          ),
          trailing: UiIcons(
            TIcons.arrowRight,
            color: TColors.neutralDarkLightest,
            size: 12,
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
