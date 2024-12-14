import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/form/counter.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_card.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:product_repository/product_repository.dart';

class ExploreProductCard extends StatelessWidget {
  final int qty;
  final Function()? onTap;
  final ProductModel product;
  final ValueChanged<int> onCounterChanged;

  const ExploreProductCard({
    super.key,
    this.qty = 0,
    this.onTap,
    required this.product,
    required this.onCounterChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = qty > 0;
    String? image = product.images.elementAtOrNull(0);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: BaseProductCard(
        image: image != null
            ? Image.network(
                image,
                height: 165.5,
                width: 208,
                fit: BoxFit.cover,
              )
            : SvgPicture.asset(
                TImages.productAvatar,
                height: 165.5,
                width: 208,
              ),
        name: product.name,
        price: int.parse(product.price),
        selected: selected,
        counter: selected
            ? FittedBox(
                child: Counter(
                  value: qty,
                  onChanged: onCounterChanged,
                ),
              )
            : null,
      ),
    );
  }
}
