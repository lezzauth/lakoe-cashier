import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/item_menu/item_menu.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

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
            icon: TIcons.dashboardQROrder,
            label: "QR Order",
            color: TColors.highlightLightest,
            routeName: "/qr-order",
          ),
          ItemMenu(
            icon: TIcons.dashboardProduct,
            label: "Produk",
            color: TColors.wraningLight,
            routeName: "/products",
          ),
          ItemMenu(
            icon: TIcons.dashboardCustomer,
            label: "Pelanggan",
            color: TColors.errorLight,
            routeName: "/customers",
          ),
          ItemMenu(
            icon: TIcons.dashboardReport,
            label: "Laporan",
            color: TColors.infoLight,
            routeName: "/reports",
          ),
        ],
      ),
    );
  }
}
