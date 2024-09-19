import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/notifications/presentation/widgets/item_notification.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NotificationMasterScreen extends StatefulWidget {
  const NotificationMasterScreen({super.key});

  @override
  State<NotificationMasterScreen> createState() =>
      _NotificationMasterScreenState();
}

class _NotificationMasterScreenState extends State<NotificationMasterScreen> {
  List<_NotificationListModel> listItemNotification = [
    _NotificationListModel(
      category: "TRANSACTION",
      title: "🛎 Pesanan masuk!",
      message: "Ada pesanan baru nih, cek detailnya ya!",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: false,
      bgColorAvatar: TColors.highlightLightest,
      colorIcon: TColors.primary,
      icon: TIcons.billChecked,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "TRANSACTION",
      title: "✅ Pembayaran diterima!",
      message:
          "Transaksi #[nomor transaksi] sebesar Rp [jumlah] berhasil dibayar dengan [metode pembayaran].",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: true,
      bgColorAvatar: TColors.infoLight,
      colorIcon: TColors.infoMedium,
      icon: TIcons.cardIn,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "TRANSACTION",
      title: "Pesanan dibatalkan",
      message: "Pesanan [nomor pesanan] telah dibatalkan.",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: true,
      bgColorAvatar: TColors.highlightLightest,
      colorIcon: TColors.primary,
      icon: TIcons.billCross,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "OFFERING",
      title: "🔥 Tingkatkan paket, penjualan meningkat!",
      message:
          "Dapatkan fitur-fitur canggih dan kapasitas lebih besar dengan upgrade ke [nama paket upgrade]. Ada promo spesial lho!",
      bannerImage: TImages.placeholderBannerNotification,
      dateTime: "Hari ini, 11:32",
      unread: false,
      bgColorAvatar: TColors.successLight,
      colorIcon: TColors.successDark,
      iconImg: TImages.growIcon,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "INFORMATION",
      title: "⚠️ Hampir mencapai batas nih!",
      message:
          "Kamu hampir/sudah mencapai batas penggunaan [fitur] di paketmu. Upgrade sekarang untuk terus pakai Lakoe tanpa hambatan!",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: false,
      bgColorAvatar: TColors.highlightLightest,
      colorIcon: TColors.primary,
      icon: TIcons.billChecked,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "INFORMATION",
      title: "Update versi terbaru, yuk!",
      message: "Lakoe sudah diupdate dengan fitur-fitur baru. Cekidot!",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: false,
      bgColorAvatar: TColors.infoLight,
      colorIcon: TColors.infoMedium,
      icon: TIcons.warning,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "INFORMATION",
      title: "Kita mau maintenance bentar ya!",
      message:
          "Lakoe akan menjalani pemeliharaan pada [tanggal & waktu]. Mohon maaf atas ketidaknyamanannya.",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: false,
      bgColorAvatar: TColors.infoLight,
      colorIcon: TColors.infoMedium,
      icon: TIcons.warning,
      routeName: "/",
    ),
    _NotificationListModel(
      category: "INFORMATION",
      title: "Stok habis!",
      message: "[nama produk] sudah habis, info ke pelanggan ya!",
      bannerImage: null,
      dateTime: "Hari ini, 11:32",
      unread: true,
      bgColorAvatar: TColors.highlightLightest,
      colorIcon: TColors.primary,
      icon: TIcons.box,
      routeName: "/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Pemberitahuan",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: "Transaksi",
                    selected: false,
                    onSelected: (value) {},
                  ),
                  FilterChip(
                    label: "Penawaran",
                    selected: false,
                    onSelected: (value) {},
                  ),
                  FilterChip(
                    label: "Info",
                    selected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ),
            ...listItemNotification.map(
              (item) => ItemNotification(
                  category: item.category,
                  title: item.title,
                  message: item.message,
                  bannerImage: item.bannerImage,
                  dateTime: item.dateTime,
                  unread: item.unread,
                  bgColorAvatar: item.bgColorAvatar,
                  colorIcon: item.colorIcon,
                  icon: item.icon,
                  iconImg: item.iconImg,
                  routeName: item.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  const FilterChip({
    super.key,
    this.selected = false,
    this.onSelected,
    required this.label,
  });

  final bool selected;
  final Function(bool)? onSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return SizedBox(
      height: 52,
      child: ChoiceChip(
        label: ResponsiveLayout(
          mobile: !selected
              ? TextBodyM(label)
              : TextHeading4(
                  label,
                  color: TColors.primary,
                ),
          tablet: !selected
              ? TextBodyL(label)
              : TextHeading3(
                  label,
                  color: TColors.primary,
                ),
        ),
        selected: selected,
        onSelected: onSelected,
        padding: isMobile
            ? null
            : const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
    );
  }
}

class _NotificationListModel {
  final String category;
  final String title;
  final String message;
  final String? bannerImage;
  final String dateTime;
  final bool unread;
  final Color bgColorAvatar;
  final Color? colorIcon;
  final String? icon;
  final String? iconImg;
  final String routeName;

  _NotificationListModel({
    required this.category,
    required this.title,
    required this.message,
    this.bannerImage,
    required this.dateTime,
    required this.unread,
    required this.bgColorAvatar,
    this.colorIcon,
    this.icon,
    this.iconImg,
    required this.routeName,
  });
}
