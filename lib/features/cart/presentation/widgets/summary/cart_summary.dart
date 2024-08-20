import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.total,
    required this.tax,
  });

  final double total;
  final double tax;

  @override
  Widget build(BuildContext context) {
    double discount = 0;
    double totalBill = (total - discount) + tax;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: TColors.neutralLightLight,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextBodyM("Total Pesanan"),
                  TextHeading4(TFormatter.formatToRupiah(total)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextBodyM("Diskon"),
                  TextHeading4(
                    "Gunakan Poin",
                    color: TColors.primary,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextBodyM("Pajak"),
                  TextHeading4(TFormatter.formatToRupiah(tax)),
                ],
              ),
              const SizedBox(height: 10),
              const Separator(
                color: TColors.neutralLightDark,
                height: 1,
                dashWidth: 5.0,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextBodyM("Total Tagihan"),
                  TextHeading4(TFormatter.formatToRupiah(totalBill)),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Separator(
            color: TColors.neutralLightDark,
            height: 1,
            dashWidth: 5.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: TColors.neutralLightLight,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextHeading3("Yang harus dibayar"),
              TextHeading3(TFormatter.formatToRupiah(totalBill)),
            ],
          ),
        ),
      ],
    );
  }
}
