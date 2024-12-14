import 'package:flutter/material.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/item_menu/item_menu.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class ItemMenuContainer extends StatelessWidget {
  const ItemMenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemMenu(
            icon: TIcons.dashboardProduct,
            label: "Produk",
            color: TColors.warningLight,
            routeName: "/products",
          ),
          ItemMenu(
            icon: TIcons.dashboardCustomer,
            label: "Pelanggan",
            color: TColors.infoLight,
            routeName: "/customers",
          ),
          ItemMenu(
            icon: TIcons.dashboardReport,
            label: "Laporan",
            color: TColors.errorLight,
            routeName: "/reports",
          ),
          ItemMenu(
            icon: TIcons.dashboardSettings,
            label: "Setting",
            color: TColors.highlightLightest,
            routeName: "/settings",
          ),
        ],
      ),
    );
  }
}
