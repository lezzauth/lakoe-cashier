import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/data/services/order/models/order_item_model.dart';
import 'package:point_of_sales_cashier/data/services/product/models/product_model.dart';
import 'package:point_of_sales_cashier/features/products/common/widgets/appbar/explore_product_appbar.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_item.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_list_button.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ExploreProductScreen extends StatefulWidget {
  const ExploreProductScreen({super.key});

  @override
  State<ExploreProductScreen> createState() => _ExploreProductScreenState();
}

class _ExploreProductScreenState extends State<ExploreProductScreen> {
  List<OrderItemModel> orderItems = [];

  List<ProductModel> products = [
    ProductModel(
      id: "23d90edc-b3bd-4de6-8719-c39a28eec1b1",
      images: ["https://picsum.photos/seed/7RiFTzd/640/480"],
      name: "Kopi Hitam",
      price: "1100",
    ),
    ProductModel(
      id: "d7f770fb-239f-4be8-b392-bf28018472b2",
      images: ["https://picsum.photos/seed/MmShku7yl/640/480"],
      name: "Kopi Susu",
      price: "1100",
    ),
    ProductModel(
      id: "d7f770fb-239f-4be8-b392-bf28018472b3",
      images: ["https://picsum.photos/200/300?random=3"],
      name: "Es Teh",
      price: "1100",
    ),
    ProductModel(
      id: "d7f770fb-239f-4be8-b392-bf28018472b4",
      images: ["https://picsum.photos/200/300?random=4"],
      name: "Mie Instan Goreng",
      price: "1100",
    ),
    ProductModel(
      id: "d7f770fb-239f-4be8-b392-bf28018472b5",
      images: ["https://picsum.photos/200/300?random=5"],
      name: "Roti Bakar",
      price: "1100",
    ),
    ProductModel(
      id: "d7f770fb-239f-4be8-b392-bf28018472b6",
      images: ["https://picsum.photos/200/300?random=6"],
      name: "Ikan Bakar",
      price: "1100",
    ),
    ProductModel(
      id: "d7f770fb-239f-4be8-b392-bf28018472b7",
      images: ["https://picsum.photos/200/300?random=7"],
      name: "Ayam Goreng",
      price: "1100",
    ),
  ];

  void onAddOrder(String productId) {
    setState(() {
      orderItems.add(OrderItemModel(quantity: 1, productId: productId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExploreProductAppbar(),
      backgroundColor: TColors.neutralLightLight,
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 2));
          },
          backgroundColor: TColors.neutralLightLightest,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                  child: SearchField(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextHeading3("Berlangsung"),
                            GestureDetector(
                              child: TextHeading4(
                                "Lihat semua",
                                color: TColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 8.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              OrderListButton(),
                              OrderItem(),
                              OrderItem(),
                              OrderItem(),
                              OrderItem(),
                              OrderItem(),
                              OrderItem(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: TColors.neutralLightLightest,
                  child: ProductCategoryFilter(),
                ),
              ),
              DecoratedSliver(
                decoration:
                    const BoxDecoration(color: TColors.neutralLightLightest),
                sliver: SliverList.builder(
                  itemBuilder: (context, index) {
                    ProductModel product = products[index];
                    OrderItemModel orderItem = orderItems.singleWhere(
                      (element) => element.productId == product.id,
                      orElse: () =>
                          OrderItemModel(quantity: 0, productId: product.id),
                    );

                    return ProductItem(
                      product: product,
                      notes: orderItem.notes,
                      qty: orderItem.quantity,
                      onTap: () {
                        onAddOrder(product.id);
                      },
                    );
                  },
                  itemCount: products.length,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: orderItems.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: SizedBox(
            height: 48,
            width: double.maxFinite,
            child: FloatingActionButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeading3(
                      "Rp20.000",
                      color: TColors.neutralLightLightest,
                    ),
                    TextHeading3(
                      "Proses Pesanan (${orderItems.length.toString()})",
                      color: TColors.neutralLightLightest,
                    ),
                  ],
                ),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}
