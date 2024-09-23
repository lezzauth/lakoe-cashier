import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/orders/data/models.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderSummary extends StatelessWidget {
  final double total;
  final double orderTotal;
  final bool isPaid;
  final Function()? onDiscountChanged;

  final List<OrderSummaryChargeModel> charges;

  const OrderSummary({
    super.key,
    required this.total,
    required this.orderTotal,
    required this.charges,
    this.onDiscountChanged,
    this.isPaid = false,
  });

  List<OrderSummaryChargeModel> _taxCharges() =>
      charges.where((e) => e.type == "TAX").toList();

  List<OrderSummaryChargeModel> _serviceFeeCharges() =>
      charges.where((e) => e.type == "CHARGE").toList();

  @override
  Widget build(BuildContext context) {
    double discount = 0;
    double totalBill = (total - discount);

    return Stack(
      children: [
        Column(
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
                      TextHeading4(TFormatter.formatToRupiah(orderTotal)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const TextBodyM("Diskon"),
                  //     GestureDetector(
                  //       child: const TextHeading4(
                  //         "Gunakan Poin",
                  //         color: TColors.primary,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 10),
                  const Separator(
                    color: TColors.neutralLightDark,
                    height: 1,
                    dashWidth: 5.0,
                  ),
                  const SizedBox(height: 10),
                  if (_taxCharges().isNotEmpty) ...[
                    ..._taxCharges().map(
                      (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBodyM(e.name),
                              TextHeading4(
                                TFormatter.formatToRupiah(
                                  double.parse(
                                    e.amount,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const Separator(
                      color: TColors.neutralLightDark,
                      height: 1,
                      dashWidth: 5.0,
                    ),
                    const SizedBox(height: 10),
                  ],
                  if (_serviceFeeCharges().isNotEmpty) ...[
                    ..._serviceFeeCharges().map(
                      (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBodyM(e.name),
                              TextHeading4(
                                TFormatter.formatToRupiah(
                                  double.parse(
                                    e.amount,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const Separator(
                      color: TColors.neutralLightDark,
                      height: 1,
                      dashWidth: 5.0,
                    ),
                    const SizedBox(height: 10),
                  ],
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
                  TextHeading2(TFormatter.formatToRupiah(totalBill)),
                ],
              ),
            ),
          ],
        ),
        if (isPaid)
          Positioned(
            bottom: 0,
            right: 48,
            child: Image.asset(
              TImages.stamp,
              height: 121,
              width: 181,
            ),
          ),
      ],
    );
  }
}
