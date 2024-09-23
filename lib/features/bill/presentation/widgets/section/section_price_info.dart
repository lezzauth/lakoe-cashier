import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/list_price.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BillPriceInfo extends StatelessWidget {
  final List<Widget> children;
  final String totalPrice;
  final String paymentMetod;
  final String moneyReceived;
  final String changeMoney;

  const BillPriceInfo({
    super.key,
    required this.children,
    required this.totalPrice,
    required this.paymentMetod,
    required this.moneyReceived,
    required this.changeMoney,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...children,
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
          price: totalPrice,
        ),
        BillListPrice(
          label: paymentMetod,
          price: moneyReceived,
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
          label: "Kembalian",
          price: changeMoney,
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
