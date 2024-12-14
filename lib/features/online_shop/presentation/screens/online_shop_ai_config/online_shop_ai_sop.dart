import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_container.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_item.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/tabs/ai_config_sop/ai_config_sop_closing_tab.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/tabs/ai_config_sop/ai_config_sop_deal_tab.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/tabs/ai_config_sop/ai_config_sop_start_tab.dart';

class OnlineShopAISOPScreen extends StatefulWidget {
  const OnlineShopAISOPScreen({super.key});

  @override
  State<OnlineShopAISOPScreen> createState() => _OnlineShopAISOPScreenState();
}

class _OnlineShopAISOPScreenState extends State<OnlineShopAISOPScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppbar(
          title: "SOP",
          bottom: const TabContainer(
            tabs: [
              TabItem(title: "Start"),
              TabItem(
                title: "Deal",
              ),
              TabItem(
                title: "Closing",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          AIConfigSopStartTab(),
          AIConfigSopDealTab(),
          AIConfigSopClosingTab(),
        ]),
      ),
    );
  }
}
