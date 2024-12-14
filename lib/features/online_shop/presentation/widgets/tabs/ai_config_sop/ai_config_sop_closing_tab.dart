import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/online_shop/data/arguments/online_shop_ai_sop_new_argument.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/timelines/sop_timeline.dart';
import 'package:lakoe_pos/features/online_shop/utils/constants/sop_items.dart';

class AIConfigSopClosingTab extends StatefulWidget {
  const AIConfigSopClosingTab({super.key});

  @override
  State<AIConfigSopClosingTab> createState() => _AIConfigSopClosingTabState();
}

class _AIConfigSopClosingTabState extends State<AIConfigSopClosingTab> {
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
              "Ketika pelanggan selesai berbelanja:",
            ),
          ),
          SOPTimeline(
            value: SOPItems.closingSOP
                .where((item) => [
                      "suggest_other_product",
                    ].contains(item.value))
                .toList(),
            onItemAdd: () {
              Navigator.pushNamed(
                context,
                "/online_shop/ai_configuration/sop/new",
                arguments: OnlineShopAISopNewArgument(type: "closing"),
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
