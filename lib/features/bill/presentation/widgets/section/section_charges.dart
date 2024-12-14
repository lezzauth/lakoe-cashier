import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/list_price.dart';
import 'package:lakoe_pos/features/orders/data/models.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class BillSectionCharges extends StatelessWidget {
  final List<OrderSummaryChargeModel> charges;
  final String totalPrice;
  final String paymentMethod;
  final String moneyReceived;
  final String changeMoney;

  const BillSectionCharges({
    super.key,
    required this.charges,
    required this.totalPrice,
    required this.paymentMethod,
    required this.moneyReceived,
    required this.changeMoney,
  });

  List<OrderSummaryChargeModel> _taxCharges() =>
      charges.where((e) => e.type == "TAX").toList();

  List<OrderSummaryChargeModel> _serviceFeeCharges() =>
      charges.where((e) => e.type == "CHARGE").toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_taxCharges().isNotEmpty)
          ..._taxCharges().map(
            (e) => BillListPrice(
              label: e.name,
              isPercentage: e.isPercentage,
              percentageValue: e.percentageValue,
              price: TFormatter.formatToRupiah(double.parse(e.amount)),
            ),
          ),
        if (_serviceFeeCharges().isNotEmpty)
          ..._serviceFeeCharges().map(
            (e) => BillListPrice(
              label: e.name,
              isPercentage: e.isPercentage,
              percentageValue: e.percentageValue,
              price: TFormatter.formatToRupiah(double.parse(e.amount)),
            ),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
        BillListPrice(
          isLarge: true,
          label: "Total",
          price: TFormatter.formatToRupiah(double.parse(totalPrice)),
        ),
        BillListPrice(
          label: paymentMethod,
          price: TFormatter.formatToRupiah(double.parse(moneyReceived)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
        BillListPrice(
          label: "Change",
          price: TFormatter.formatToRupiah(double.parse(changeMoney)),
          isBold: true,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Separator(
                color: TColors.neutralDarkDarkest,
                height: 0.5,
                dashWidth: 4.0,
              ),
              SizedBox(height: 2),
              Separator(
                color: TColors.neutralDarkDarkest,
                height: 0.5,
                dashWidth: 4.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
