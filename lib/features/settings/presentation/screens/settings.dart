import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/list_item_card.dart';
import 'package:lakoe_pos/common/widgets/ui/section_card.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_cubit.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    context.read<OwnerCubit>().init();
    context.read<OutletCubit>().init();

    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 0 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
  ];
  List<_SettingItem> employeeSettingItems = [];
  List<_SettingItem> otherSettingItems = [
    // _SettingItem(
    //   title: "Kelola Toko Online",
    //   routeName: "/online_shop",
    //   iconSrc: TIcons.shop,
    //   isNewItem: true,
    // ),
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
    _SettingItem(
      title: "Print & Struk (Bill)",
      routeName: "/print",
      iconSrc: TIcons.bill,
    ),
    // _SettingItem(
    //   title: "Singkronisasi Data",
    //   routeName: "/",
    //   iconSrc: TIcons.smartphoneUpdate,
    // ),
    // _SettingItem(
    //   title: "Sambungkan Aplikasi",
    //   routeName: "/",
    //   iconSrc: TIcons.linkSquare,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Pengaturan",
        backgroundColor: TColors.neutralLightLightest,
        isScrolled: _isScrolled,
        actions: const [],
      ),
      backgroundColor: TColors.neutralLightLight,
      body: SingleChildScrollView(
        controller: _scrollController,
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
                  title: "Daftar Kasir",
                  description: "Kelola data kasir yang ditugaskan",
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
                  iconSrc: TIcons.bill,
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
  final bool isNewItem = false;

  _SettingItem({
    required this.title,
    required this.routeName,
    required this.iconSrc,
  });
}
