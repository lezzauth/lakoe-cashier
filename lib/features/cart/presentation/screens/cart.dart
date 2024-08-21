import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/contact/contact_list.dart';
import 'package:point_of_sales_cashier/common/widgets/form/counter.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/cards/card_order.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/summary/cart_summary.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Pesanan Baru",
      ),
      body: SafeArea(
        child: Scrollbar(
          child: RefreshIndicator(
            onRefresh: () async {
              return await Future.delayed(Duration(seconds: 1));
            },
            backgroundColor: TColors.neutralLightLightest,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Cart(),
            ),
          ),
        ),
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    onCustomerOpened() {
      return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return Padding(
            padding: TDeviceUtils.getViewInsets(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    hintText: "Cari pelanggan...",
                  ),
                ),
                Expanded(
                  child: ContactList(),
                )
              ],
            ),
          );
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CustomScrollView(
            // mainAxisSize: MainAxisSize.min,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CardOrder(
                          title: "Pelanggan",
                          subTitle: "Umum",
                          icon: UiIcons(
                            TIcons.profile,
                            height: 20,
                            width: 20,
                            color: TColors.primary,
                          ),
                          onTap: onCustomerOpened,
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        flex: 1,
                        child: CardOrder(
                          title: "No. Meja",
                          subTitle: "Bebas",
                          icon: UiIcons(
                            TIcons.tableRestaurant,
                            height: 20,
                            width: 20,
                            color: TColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeading3("Pesanan"),
                    GestureDetector(
                      onTap: () {},
                      child: TextHeading4(
                        "Tambah Pesanan",
                        color: TColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: TColors.neutralLightMedium,
                          width: 1,
                        ),
                      ),
                    ),
                    child: BaseProductItem(
                      name: "Kopi Hitam $index",
                      price: (index + 1) * 10000,
                      image: Image.network(
                        "https://picsum.photos/200?random=$index",
                        height: 44,
                        width: 44,
                        fit: BoxFit.cover,
                      ),
                      counter: Counter(
                        value: 1,
                        onChanged: (value) {},
                      ),
                      notes: "Gulanya sedikit aja",
                      noteAction: ProductNoteAction(
                        onChanged: (notes) {
                          print('notes: $notes');
                        },
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 28.0),
                  child: CartSummary(
                    tax: 7500,
                    total: 20000,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                height: 48.0,
                child: OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        // vertical: 15.5,
                        horizontal: 26,
                      ),
                    ),
                    side: WidgetStatePropertyAll(
                      BorderSide(
                        color: TColors.primary,
                        width: 1.5,
                      ),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    "Simpan",
                    style: GoogleFonts.inter(
                      color: TColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: TSizes.fontSizeActionL,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: TextActionL(
                      "Bayar & Selesai",
                      color: TColors.neutralLightLightest,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
