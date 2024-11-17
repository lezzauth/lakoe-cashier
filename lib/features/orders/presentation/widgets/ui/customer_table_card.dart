import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/cards/card_order.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class CustomerAndTableInformation extends StatelessWidget {
  const CustomerAndTableInformation({
    super.key,
    this.customer,
    this.table,
  });

  final OrderCustomer? customer;
  final OrderTable? table;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: CardOrder(
            isReadOnly: true,
            title: "Pelanggan",
            subTitle: customer == null ? "Umum" : customer!.name,
            icon: const UiIcons(
              TIcons.profile,
              size: 20,
              color: TColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Flexible(
          flex: 1,
          child: CardOrder(
            isReadOnly: true,
            title: "Meja",
            subTitle: table == null ? "Bebas" : table!.no,
            icon: const UiIcons(
              TIcons.tableRestaurant,
              size: 20,
              color: TColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
