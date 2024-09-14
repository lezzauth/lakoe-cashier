import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/settings/presentation/widgets/section/section_card.dart';
import 'package:point_of_sales_cashier/features/settings/presentation/widgets/section/section_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.isCurrent == true) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: TColors.neutralLightLightest,
        systemNavigationBarColor: TColors.neutralLightLight,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: TColors.neutralLightLightest,
      ));
    }
  }

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
      title: "Struk (Bill)",
      routeName: "/",
      iconSrc: TIcons.bill,
    ),
  ];
  List<_SettingItem> employeeSettingItems = [];
  List<_SettingItem> otherSettingItems = [
    _SettingItem(
      title: "Kategori",
      routeName: "/categories",
      iconSrc: TIcons.box,
    ),
    _SettingItem(
      title: "Meja & QR Order",
      routeName: "/tables",
      iconSrc: TIcons.tableRestaurant,
      isNewItem: true,
    ),
    _SettingItem(
      title: "Print",
      routeName: "/",
      iconSrc: TIcons.printer,
    ),
    // _SettingItem(
    //   title: "Singkronisasi Data",
    //   routeName: "/",
    //   iconSrc: TIcons.smartphoneUpdate,
    // ),
    _SettingItem(
      title: "Integrasi",
      routeName: "/",
      iconSrc: TIcons.linkCircle,
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
            //   child: SettingSectionCard(
            //     title: "Produk & Service",
            //     children: productServiceSettingItems
            //         .map(
            //           (item) => SettingSectionItem(
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
              child: SettingSectionCard(
                title: "Karyawan",
                description: "Manajemen, Hak akses atau PIN",
                children: employeeSettingItems
                    .map(
                      (item) => SettingSectionItem(
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
              child: SettingSectionCard(
                title: "Pembayaran & Struk",
                children: paymentReceiptSettingItems
                    .map(
                      (item) => SettingSectionItem(
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
              child: SettingSectionCard(
                title: "Lainnya",
                children: otherSettingItems
                    .map(
                      (item) => SettingSectionItem(
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
