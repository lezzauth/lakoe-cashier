import 'package:flutter/material.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/item_menu/item_menu.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class ItemMenuContainer extends StatelessWidget {
  const ItemMenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: const Row(
        children: [
          ItemMenu(
            icon: TIcons.dashboardProduct,
            label: "Produk",
            color: TColors.warningLight,
            routeName: "/products",
          ),
          SizedBox(width: 20),
          ItemMenu(
            icon: TIcons.dashboardReport,
            label: "Laporan",
            color: TColors.errorLight,
            routeName: "/reports",
          ),
          SizedBox(width: 20),
          ItemMenu(
            icon: TIcons.dashboardSettings,
            label: "Setting",
            color: TColors.infoLight,
            routeName: "/settings",
          ),
        ],
      ),
    );
  }
}
