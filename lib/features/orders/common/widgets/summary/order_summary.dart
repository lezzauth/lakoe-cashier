import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/ui/shimmer/shimmer_text.dart';
import 'package:point_of_sales_cashier/features/orders/data/models.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderSummary extends StatelessWidget {
  final double total;
  final double orderTotal;
  final bool isPaid;
  final List<Transactions>? paymentInfo;
  final Function()? onDiscountChanged;
  final bool? isRefresh;

  final List<OrderSummaryChargeModel> charges;

  const OrderSummary({
    super.key,
    required this.total,
    required this.orderTotal,
    required this.charges,
    this.onDiscountChanged,
    this.isPaid = false,
    this.paymentInfo,
    this.isRefresh = false,
  });

  List<OrderSummaryChargeModel> _taxCharges() =>
      charges.where((e) => e.type == "TAX").toList();

  List<OrderSummaryChargeModel> _serviceFeeCharges() =>
      charges.where((e) => e.type == "CHARGE").toList();

  Map<String, dynamic> _getPaymentInfo(Transactions payment) {
    String modifiedPaymentMethod = payment.paymentMethod;

    if (payment.paymentMethod == 'QR_CODE' && payment.paidFrom == 'EDC') {
      modifiedPaymentMethod = 'QRIS EDC';
    } else if (payment.paymentMethod == 'QR_CODE' &&
        payment.paidFrom == 'CASHIER') {
      modifiedPaymentMethod = 'QRIS';
    } else if (payment.paymentMethod == 'CASH') {
      modifiedPaymentMethod = 'Cash (Tunai)';
    } else if (payment.paymentMethod == 'DEBIT') {
      modifiedPaymentMethod = 'Debit/Credit';
    } else if (payment.paymentMethod == 'BANK_TRANSFER') {
      modifiedPaymentMethod = 'Transfer Bank';
    }

    double paidAmount = 0.0;
    if (payment.paidAmount.isNotEmpty) {
      paidAmount = double.tryParse(payment.paidAmount) ?? 0.0;
    }

    double changeAmount = 0.0;
    if (payment.change.isNotEmpty) {
      changeAmount = double.tryParse(payment.change) ?? 0.0;
    }

    return {
      'paidAmount': paidAmount,
      'paymentMethod': modifiedPaymentMethod,
      'change': changeAmount,
    };
  }

  @override
  Widget build(BuildContext context) {
    double discount = 0;
    double totalBill = (total - discount);
    Map<String, dynamic> paymentDetails = {};
    if (isPaid && paymentInfo != null) {
      paymentDetails = _getPaymentInfo(paymentInfo![0]);
    }

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
                      (!isRefresh!)
                          ? TextHeading4(TFormatter.formatToRupiah(orderTotal))
                          : ShimmerText(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Separator(
                    color: TColors.neutralLightDark,
                    height: 1,
                    dashWidth: 5.0,
                  ),
                  const SizedBox(height: 8),
                  if (_taxCharges().isNotEmpty) ...[
                    ..._taxCharges().map(
                      (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBodyM((e.isPercentage)
                                  ? "${e.name} (${e.percentageValue}%)"
                                  : e.name),
                              (!isRefresh!)
                                  ? TextHeading4(
                                      TFormatter.formatToRupiah(
                                        double.parse(
                                          e.amount,
                                        ),
                                      ),
                                    )
                                  : ShimmerText(),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                  if (_serviceFeeCharges().isNotEmpty) ...[
                    ..._serviceFeeCharges().map(
                      (e) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBodyM((e.isPercentage)
                                  ? "${e.name} (${e.percentageValue}%)"
                                  : e.name),
                              (!isRefresh!)
                                  ? TextHeading4(
                                      TFormatter.formatToRupiah(
                                        double.parse(
                                          e.amount,
                                        ),
                                      ),
                                    )
                                  : ShimmerText(),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const Separator(
                      color: TColors.neutralLightDark,
                      height: 1,
                      dashWidth: 5.0,
                    ),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextBodyM("Total Tagihan"),
                      (!isRefresh!)
                          ? TextHeading4(TFormatter.formatToRupiah(totalBill))
                          : ShimmerText(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (isPaid && paymentInfo != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBodyM(paymentDetails['paymentMethod']),
                        Row(
                          children: [
                            paymentDetails['paymentMethod'] == 'Transfer Bank'
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/orders/proof");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: UiIcons(
                                        TIcons.image,
                                        width: 16,
                                        height: 16,
                                        color: TColors.primary,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            TextHeading4(
                              TFormatter.formatToRupiah(
                                paymentDetails['paidAmount'],
                              ),
                            ),
                          ],
                        ),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextHeading3("Yang harus dibayar"),
                      (!isRefresh!)
                          ? TextHeading2(TFormatter.formatToRupiah(totalBill))
                          : ShimmerText(height: 26, width: 120),
                    ],
                  ),
                  if (isPaid && paymentInfo != null)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: Separator(
                            color: TColors.neutralLightDark,
                            height: 1,
                            dashWidth: 5.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextBodyM("Kembalian"),
                            (!isRefresh!)
                                ? TextHeading4(
                                    TFormatter.formatToRupiah(
                                      paymentDetails['change'],
                                    ),
                                  )
                                : ShimmerText(),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        if (isPaid)
          Positioned(
            bottom: 40,
            right: 48,
            child: SvgPicture.asset(
              TImages.stampPaid,
              width: 80,
              height: 80,
            ),
          ),
      ],
    );
  }
}
