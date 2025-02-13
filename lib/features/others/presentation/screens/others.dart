import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/vote_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/list_item_card.dart';
import 'package:lakoe_pos/common/widgets/ui/section_card.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_cubit.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({super.key});

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
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

  List<_SettingItem> cardGroupEmployee = [
    _SettingItem(
      title: "Daftar Kasir",
      routeName: "/employee",
      iconSrc: TIcons.profile,
    ),
    // _SettingItem(
    //   title: "Laporan Shift",
    //   routeName: "/shift-report",
    //   iconSrc: TIcons.squareTransfer,
    //   isNewItem: true,
    // ),
  ];

  List<_SettingItem> cardGroupTransaction = [
    _SettingItem(
      title: "Riwayat Pesanan",
      routeName: "/orders",
      iconSrc: TIcons.bill,
    ),
    _SettingItem(
      title: "Metode Pembayaran",
      routeName: "/payment_method",
      iconSrc: TIcons.qrcode,
    ),
    _SettingItem(
      title: "Rekening Bank",
      routeName: "/bank_accounts",
      iconSrc: TIcons.card,
    ),
  ];

  List<_SettingItem> cardGroupCustomer = [
    _SettingItem(
      title: "Data Pelanggan",
      routeName: "/customers",
      iconSrc: TIcons.profile,
    ),
    _SettingItem(
      title: "Program Loyalitas",
      routeName: "",
      iconSrc: TIcons.coinLakoe,
    ),
  ];

  List<_SettingItem> cardGroupCost = [
    _SettingItem(
      title: "Pajak",
      routeName: "/taxes",
      iconSrc: TIcons.pieChart,
    ),
    _SettingItem(
      title: "Biaya Lainnya",
      routeName: "/charges",
      iconSrc: TIcons.tag,
    ),
  ];

  List<_SettingItem> cardGroupOther = [
    _SettingItem(
      title: "Print & Struk",
      routeName: "/print",
      iconSrc: TIcons.printer,
      isNewItem: true,
    ),
    _SettingItem(
      title: "Data Meja",
      routeName: "/tables",
      iconSrc: TIcons.tableRestaurant,
    ),
    _SettingItem(
      title: "Kategori Produk",
      routeName: "/categories",
      iconSrc: TIcons.box,
    ),
    // _SettingItem(
    //   title: "Kelola Toko Online",
    //   routeName: "/online_shop",
    //   iconSrc: TIcons.shop,
    //   isNewItem: true,
    // ),
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

  void openBottomsheetVote(BuildContext context) {
    VoteBottomSheetHelper.show(
      context: context,
      featureName: "CustomerLoyalty",
      featureDesc: "loyalitas pelanggan untuk meningkatkan repeat order",
      onVoteSuccess: () {
        CustomToast.show(
          "Vote berhasil dikirimkan.",
          position: "bottom",
          backgroundColor: TColors.success,
        );
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Menu Lainnya",
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
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                children: cardGroupEmployee
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                        isNewItem: item.isNewItem ?? false,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                children: cardGroupTransaction
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                        isNewItem: item.isNewItem ?? false,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                children: cardGroupCustomer
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                        isNewItem: item.isNewItem ?? false,
                        onTap: () {
                          openBottomsheetVote(context);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                children: cardGroupCost
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                        isNewItem: item.isNewItem ?? false,
                      ),
                    )
                    .toList(),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SectionCard(
                children: cardGroupOther
                    .map(
                      (item) => ListItemCard(
                        iconSrc: item.iconSrc,
                        title: item.title,
                        routeName: item.routeName,
                        isNewItem: item.isNewItem ?? false,
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
  final bool? isNewItem;

  _SettingItem({
    required this.title,
    required this.routeName,
    required this.iconSrc,
    this.isNewItem = false,
  });
}
