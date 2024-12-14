import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/online_shop/data/arguments/online_shop_ai_sop_new_argument.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/timelines/sop_timeline.dart';
import 'package:lakoe_pos/features/online_shop/utils/constants/sop_items.dart';

class AIConfigSopStartTab extends StatefulWidget {
  const AIConfigSopStartTab({super.key});

  @override
  State<AIConfigSopStartTab> createState() => _AIConfigSopStartTabState();
}

class _AIConfigSopStartTabState extends State<AIConfigSopStartTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: TextHeading4(
              "Ketika pelanggan memulai percakapan :",
            ),
          ),
          SOPTimeline(
            value: SOPItems.startSOP
                .where(
                  (item) => [
                    "product_stock_explanation",
                  ].contains(item.value),
                )
                .toList(),
            onItemAdd: () {
              Navigator.pushNamed(
                context,
                "/online_shop/ai_configuration/sop/new",
                arguments: OnlineShopAISopNewArgument(type: "start"),
              );
            },
            onItemTap: (sop) {
              //
            },
          )
        ],
      ),
    );
  }
}
