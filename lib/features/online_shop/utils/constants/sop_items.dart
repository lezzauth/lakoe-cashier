import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class SOPItems {
  SOPItems._();

  static List<SOPItem> startSOP = [
    SOPItem(
      title: "Penjelasan dan Ketersediaan Barang",
      description:
          'Contoh: "Selamat pagi, Bapak/Ibu. Ada yang bisa saya bantu hari ini?"',
      value: "product_stock_explanation",
      iconSrc: TIcons.box2,
    ),
  ];
  static List<SOPItem> dealSOP = [
    SOPItem(
      title: "Tanyakan Nama",
      description: 'AI akan menanyakan dan mencatat nama pelanggan ',
      value: "ask_name",
      iconSrc: TIcons.peopleOutline,
    ),
    SOPItem(
        title: "Tanyakan Alamat",
        description:
            'Contoh: "Selamat pagi, Bapak/Ibu. Ada yang bisa saya bantu hari ini?"',
        value: "ask_address",
        iconSrc: TIcons.homeOutline),
    SOPItem(
      title: "Metode Pembayaran",
      description:
          'Contoh: "Selamat pagi, Bapak/Ibu. Ada yang bisa saya bantu hari ini?"',
      value: "ask_payment_method",
      iconSrc: TIcons.wallet2,
    ),
    SOPItem(
      title: "Koleksi Data",
      description: 'Mencatat data custom untuk keperluan third party dan API',
      value: "ask_collect_data",
      iconSrc: TIcons.data,
    ),
  ];
  static List<SOPItem> closingSOP = [
    SOPItem(
        title: "Tawarkan Barang Lain",
        description:
            'Contoh: "Selamat pagi, Bapak/Ibu. Ada yang bisa saya bantu hari ini?"',
        value: "suggest_other_product",
        iconSrc: TIcons.wallet2),
  ];
}

class SOPItem {
  final String title;
  final String description;
  final String value;
  final String iconSrc;

  SOPItem({
    required this.title,
    required this.description,
    required this.value,
    required this.iconSrc,
  });
}
