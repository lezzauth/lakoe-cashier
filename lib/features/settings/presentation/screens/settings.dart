import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/list_item_card.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/section_card.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<_SettingItem> productServiceSettingItems = [
    // _SettingItem(
    //   title: "Kategori",
    //   routeName: "/categories",
    //   iconSrc: TIcons.box,
    // ),
    // _SettingItem(
    //   title: "Satuan Produk",
    //   routeName: "/products",
    //   iconSrc: TIcons.filters,
    // ),
    // _SettingItem(
    //   title: "Supplier",
    //   routeName: "/",
    //   iconSrc: TIcons.userId,
    // ),
  ];
  List<_SettingItem> paymentReceiptSettingItems = [
    _SettingItem(
      title: "Metode Pembayaran",
      routeName: "/payment_method",
      iconSrc: TIcons.dashboardQROrder,
    ),
    _SettingItem(
      title: "Rekening Bank",
      routeName: "/bank_accounts",
      iconSrc: TIcons.card,
    ),
    _SettingItem(
      title: "Pajak",
      routeName: "/taxes",
      iconSrc: TIcons.pieChart,
    ),
    _SettingItem(
      title: "Biaya Lainnya",
      routeName: "/charges",
      iconSrc: TIcons.handMoney,
    ),
    _SettingItem(
      title: "Print & Struk (Bill)",
      routeName: "/print",
      iconSrc: TIcons.bill,
    ),
  ];
  List<_SettingItem> employeeSettingItems = [];
  List<_SettingItem> otherSettingItems = [
    _SettingItem(
      title: "Kelola Toko Online",
      routeName: "/online_store",
      iconSrc: TIcons.shop,
      isNewItem: true,
    ),
    _SettingItem(
      title: "Kategori",
      routeName: "/categories",
      iconSrc: TIcons.box,
    ),
    _SettingItem(
      title: "Meja & QR Order",
      routeName: "/tables",
      iconSrc: TIcons.tableRestaurant,
    ),
    // _SettingItem(
    //   title: "Print",
    //   routeName: "/",
    //   iconSrc: TIcons.printer,
    // ),
    // _SettingItem(
    //   title: "Singkronisasi Data",
    //   routeName: "/",
    //   iconSrc: TIcons.smartphoneUpdate,
    // ),
    _SettingItem(
      title: "Sambungkan Aplikasi",
      routeName: "/",
      iconSrc: TIcons.linkSquare,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Pengaturan",
        backgroundColor: TColors.neutralLightLightest,
        actions: [],
      ),
      backgroundColor: TColors.neutralLightLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   margin: const EdgeInsets.only(bottom: 12),
            //   child: const LoyaltyProgramBanner(),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 12),
            //   child: SectionCard(
            //     title: "Produk & Service",
            //     children: productServiceSettingItems
            //         .map(
            //           (item) => ListItemCard(
            //             iconSrc: item.iconSrc,
            //             title: item.title,
            //             routeName: item.routeName,
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/employee");
                },
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                splashColor: TColors.neutralLightLight,
                highlightColor: TColors.neutralLightLight,
                child: SectionCard(
                  title: "Karyawan",
                  description: "Manajemen, Hak akses atau PIN",
                  children: null,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/orders",
                    arguments: {
                      "previousScreen": "Settings",
                    },
                  );
                },
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                splashColor: TColors.neutralLightLight,
                highlightColor: TColors.neutralLightLight,
                child: SectionCard(
                  iconSrc: TIcons.history,
                  title: "Riwayat Pesanan",
                  children: null,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                title: "Pembayaran & Struk",
                children: paymentReceiptSettingItems
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                      ),
                    )
                    .toList(),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                title: "Lainnya",
                children: otherSettingItems
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                        isNewItem: item.isNewItem,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingItem {
  final String title;
  final String routeName;
  final String iconSrc;
  final bool isNewItem;

  _SettingItem({
    required this.title,
    required this.routeName,
    required this.iconSrc,
    this.isNewItem = false,
  });
}
