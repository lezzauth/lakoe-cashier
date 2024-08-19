import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/data/services/product/models/product_model.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class ProductItem extends StatelessWidget {
  final int? qty;
  final String? notes;
  final Function()? onTap;
  final ProductModel product;

  const ProductItem({
    super.key,
    this.qty,
    this.notes,
    this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = qty! > 0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: isSelected ? TColors.highlightLightest : null,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? TColors.highlightMedium : Colors.transparent,
              width: 1,
            ),
          ),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            // direction: Axis.horizontal,
            // spacing: 12.0,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Image.network(
                  product.images[0],
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeading4(product.name),
                                TextBodyM(
                                  "Rp${product.price}",
                                  color: TColors.neutralDarkLight,
                                ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            Container(
                              decoration: BoxDecoration(
                                color: TColors.neutralLightLightest,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: TColors.highlightMedium,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 36,
                                    height: 36,
                                    child: IconButton(
                                      // style: ButtonStyle(),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        size: 16,
                                        color: TColors.error,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width: 36,
                                    child: Center(
                                      child: Text(
                                        qty.toString(),
                                        style: GoogleFonts.inter(
                                          fontSize: TSizes.fontSizeActionL,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 36,
                                    height: 36,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      if (isSelected)
                        Row(
                          children: [
                            GestureDetector(
                              child: TextHeading5(
                                "Tambah Catatan",
                                color: TColors.primary,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
