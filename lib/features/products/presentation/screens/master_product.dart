import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/appbar/master_product_appbar.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class MasterProductScreen extends StatefulWidget {
  const MasterProductScreen({super.key});

  @override
  State<MasterProductScreen> createState() => _MasterProductScreenState();
}

class _MasterProductScreenState extends State<MasterProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> _products = [
      // 1,
      // 2,
      // 3,
      // 4,
      // 5,
      // 6,
      // 7,
      // 8,
      // 9,
      // 10,
      // 11,
      // 12,
      // 13,
      // 14,
      // 15
    ];

    return Scaffold(
      appBar: const MasterProductAppbar(),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: TColors.neutralLightLightest,
                  child: const ProductCategoryFilter(),
                ),
              ),
              if (_products.isNotEmpty)
                SliverList.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: TColors.neutralLightMedium, width: 1),
                        ),
                      ),
                      child: BaseProductItem(
                        name: "Kopi Hitam ${index + 1}",
                        price: (index + 1) * 10000,
                        image: Image.network(
                          "https://picsum.photos/200?random=$index",
                          height: 44,
                          width: 44,
                          fit: BoxFit.cover,
                        ),
                        notes: "Gulanya sedikit aja",
                      ),
                    );
                  },
                ),
              if (_products.isEmpty)
                SliverToBoxAdapter(
                  child: EmptyList(
                    title: "Belum ada produk, nih!",
                    subTitle: "Yuk! Masukan produk kamu dan mulai berjualan.",
                    image: SvgPicture.asset(
                      TImages.productEmpty,
                      height: 200,
                      width: 276,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 48,
        width: 48,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/products/new");
          },
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({
    super.key,
    this.image,
    required this.title,
    required this.subTitle,
  });

  final SvgPicture? image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 92),
          child: Column(
            children: [
              image ??
                  SvgPicture.asset(
                    TImages.searchEmpty,
                    height: 200,
                    width: 276,
                  ),
              Container(
                margin: EdgeInsets.only(top: 28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextHeading2(title),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 311,
                      ),
                      child: TextBodyM(
                        subTitle,
                        color: TColors.neutralDarkLight,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
