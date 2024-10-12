import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/cards/sop_item_card.dart';
import 'package:point_of_sales_cashier/features/online_shop/utils/constants/sop_items.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class SOPTimeline extends StatefulWidget {
  const SOPTimeline({
    super.key,
    required this.value,
    required this.onItemAdd,
    required this.onItemTap,
  });

  final List<SOPItem> value;
  final Function() onItemAdd;
  final Function(SOPItem) onItemTap;

  @override
  State<SOPTimeline> createState() => _SOPTimelineState();
}

class _SOPTimelineState extends State<SOPTimeline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.value.map((item) {
        bool isLast = widget.value.last == item;

        return Column(
          children: [
            SOPItemCard(
              description: item.description,
              title: item.title,
              iconSrc: item.iconSrc,
              onTap: () {
                widget.onItemTap(item);
              },
            ),
            Container(
              width: 1,
              height: 24,
              color: TColors.primary,
            ),
            if (isLast)
              InkWell(
                onTap: widget.onItemAdd,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: TColors.primary,
                  ),
                  child: Center(
                    child: UiIcons(
                      TIcons.add,
                      color: TColors.neutralLightLightest,
                    ),
                  ),
                ),
              )
          ],
        );
      }).toList(),
    );
  }
}
