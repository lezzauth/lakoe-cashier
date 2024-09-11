import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_card.dart';
import 'package:product_repository/product_repository.dart';

class ExploreProductCard extends StatelessWidget {
  final int qty;
  final Function()? onTap;
  final ProductModel product;

  const ExploreProductCard({
    super.key,
    this.qty = 0,
    this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = qty > 0;
    String? image = product.images.elementAtOrNull(0);
    image ??= "https://placehold.co/208/165/png?text=[...]";

    return InkWell(
      onTap: onTap,
      child: BaseProductCard(
        image: Image.network(
          image,
          height: 165.5,
          width: 208,
          fit: BoxFit.cover,
        ),
        name: product.name,
        price: int.parse(product.price),
        selected: selected,
      ),
    );
  }
}
